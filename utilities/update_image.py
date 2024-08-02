import json
import argparse
import os

def str2bool(v):
    if isinstance(v, bool):
        return v
    if v.lower() in ("true", "t"):
        return True
    elif v.lower() in ("false", "f"):
        return False
    else:
        raise argparse.ArgumentTypeError("Boolean value expected.")

# Initialize argument parser
parser = argparse.ArgumentParser()
parser.add_argument("--pl_repo", required=True)
parser.add_argument("--question_folder")
parser.add_argument("--language", required=True)
parser.add_argument("--image", required=True)
parser.add_argument("--tag", required=True)
parser.add_argument("--log_output", default=False, type=str2bool)
args = parser.parse_args()

# Assert valid inputs
assert args.language in ["r", "python"], f"This script does not support the language {args.language}"
assert args.image.endswith("-" + args.language), "Your image does not match the language provided"
assert args.image.startswith("ubcmds/"), "You must use an image from the MDS docker repository (eg. ubcmds/base-r)"
assert ':' not in args.image, "Please do not include the tag in the image argument. Use --tag instead"
assert ':' not in args.tag and '/' not in args.tag, "Please do not include the image in the tag argument. Use --image instead"
assert args.tag is not 'latest', "We do not allow the use of the latest tag"

# Initialize a dictionary to store messages
messages = {}

def add_message(key, message):
    if key not in messages:
        messages[key] = []
    messages[key].append(message)

def process_info_file(info_file):
    try:
        with open(info_file, "r") as f:
            question_info = json.load(f)
        
        if 'workspaceOptions' not in question_info:
            if args.question_folder:
                add_message("Not a workspace question", f"Not a workspace question in file {info_file}")
            return
        
        image = question_info["workspaceOptions"]["image"]

        if ("-" + args.language + ":") not in image:
            add_message("Language mismatch", f"Language is '{args.language}' but image was '{image}' in file {info_file} - skipping")
            return

        if image == (args.image + ":" + args.tag):
            add_message("Image exists", f"Image already matches '{args.image}:{args.tag}' in file {info_file} - skipping")
            return

        question_info["workspaceOptions"]["image"] = args.image + ":" + args.tag

        with open(info_file, "w") as f:
            json.dump(question_info, f, indent=4)

        add_message("Success", f"Wrote image '{question_info['workspaceOptions']['image']}' to '{info_file}'")

    except Exception as e:
        add_message("Error", f"Error processing file {info_file}: {e}")

def find_info_files(directory):
    info_files = []
    for root, _, files in os.walk(directory):
        if "info.json" in files:
            info_files.append(os.path.join(root, "info.json"))
    return info_files

if args.question_folder:
    question_folder = f"{args.pl_repo}/questions/{args.question_folder}"
    info_file = os.path.join(question_folder, "info.json")
    if os.path.isfile(info_file):
        process_info_file(info_file)
    else:
        add_message("File not found", f"No info.json found in the specified question folder: {question_folder}")
else:
    questions_dir = f"{args.pl_repo}/questions"
    info_files = find_info_files(questions_dir)
    for info_file in info_files:
        process_info_file(info_file)

# Sort and prepare the messages for output
output = []
for key in sorted(messages.keys()):
    output.append(f"{key}:")
    for message in messages[key]:
        output.append(f"  - {message}")

# Print messages to console
for line in output:
    print(line)

# Print number of changes to console
success_count = len(messages.get("Success", []))
print(f"\nChanged {success_count} file(s)")

# Write messages to log file if log_output is True
if args.log_output:
    with open("output_log.txt", "w") as log_file:
        for line in output:
            log_file.write(line + "\n")
