--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-10-30 23:17:18 PDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 27100)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    artist_name character varying(50) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27008)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    title character varying(50)
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 27007)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_id_seq OWNER TO postgres;

--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 215
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- TOC entry 218 (class 1259 OID 27022)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id integer NOT NULL,
    emp_name text NOT NULL,
    age integer,
    salary integer,
    CONSTRAINT employee_age_check CHECK ((age > 0)),
    CONSTRAINT employee_salary_check CHECK ((salary >= 0))
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27032)
-- Name: login_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_info (
    id integer NOT NULL,
    employee_id integer
);


ALTER TABLE public.login_info OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27031)
-- Name: login_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_info_id_seq OWNER TO postgres;

--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 219
-- Name: login_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_info_id_seq OWNED BY public.login_info.id;


--
-- TOC entry 223 (class 1259 OID 27115)
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    playlist_id integer NOT NULL,
    playlist_name character varying(50) NOT NULL,
    song_id integer
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 27105)
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    artist_id integer,
    yearofrelease integer
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 27014)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    name character varying(50) NOT NULL,
    gpa double precision,
    course_id integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 3468 (class 2604 OID 27011)
-- Name: course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 27035)
-- Name: login_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_info ALTER COLUMN id SET DEFAULT nextval('public.login_info_id_seq'::regclass);


--
-- TOC entry 3637 (class 0 OID 27100)
-- Dependencies: 221
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (artist_id, artist_name) FROM stdin;
1	Artist 1
2	Artist 2
3	Artist 3
4	Artist 4
5	Artist 5
6	Artist 6
7	Artist 7
8	Artist 8
9	Artist 9
10	Artist 10
11	Artist 11
12	Artist 12
13	Artist 13
14	Artist 14
15	Artist 15
16	Artist 16
17	Artist 17
18	Artist 18
19	Artist 19
20	Artist 20
21	Artist 21
22	Artist 22
23	Artist 23
24	Artist 24
25	Artist 25
26	Artist 26
27	Artist 27
28	Artist 28
29	Artist 29
30	Artist 30
31	Artist 31
32	Artist 32
33	Artist 33
34	Artist 34
35	Artist 35
36	Artist 36
37	Artist 37
38	Artist 38
39	Artist 39
40	Artist 40
41	Artist 41
42	Artist 42
43	Artist 43
44	Artist 44
45	Artist 45
46	Artist 46
47	Artist 47
48	Artist 48
49	Artist 49
50	Artist 50
51	Artist 51
52	Artist 52
53	Artist 53
54	Artist 54
55	Artist 55
56	Artist 56
57	Artist 57
58	Artist 58
59	Artist 59
60	Artist 60
61	Artist 61
62	Artist 62
63	Artist 63
64	Artist 64
65	Artist 65
66	Artist 66
67	Artist 67
68	Artist 68
69	Artist 69
70	Artist 70
71	Artist 71
72	Artist 72
73	Artist 73
74	Artist 74
75	Artist 75
76	Artist 76
77	Artist 77
78	Artist 78
79	Artist 79
80	Artist 80
81	Artist 81
82	Artist 82
83	Artist 83
84	Artist 84
85	Artist 85
86	Artist 86
87	Artist 87
88	Artist 88
89	Artist 89
90	Artist 90
91	Artist 91
92	Artist 92
93	Artist 93
94	Artist 94
95	Artist 95
96	Artist 96
97	Artist 97
98	Artist 98
99	Artist 99
100	Artist 100
101	Artist 101
102	Artist 102
103	Artist 103
104	Artist 104
105	Artist 105
106	Artist 106
107	Artist 107
108	Artist 108
109	Artist 109
110	Artist 110
111	Artist 111
112	Artist 112
113	Artist 113
114	Artist 114
115	Artist 115
116	Artist 116
117	Artist 117
118	Artist 118
119	Artist 119
120	Artist 120
121	Artist 121
122	Artist 122
123	Artist 123
124	Artist 124
125	Artist 125
126	Artist 126
127	Artist 127
128	Artist 128
129	Artist 129
130	Artist 130
131	Artist 131
132	Artist 132
133	Artist 133
134	Artist 134
135	Artist 135
136	Artist 136
137	Artist 137
138	Artist 138
139	Artist 139
140	Artist 140
141	Artist 141
142	Artist 142
143	Artist 143
144	Artist 144
145	Artist 145
146	Artist 146
147	Artist 147
148	Artist 148
149	Artist 149
150	Artist 150
151	Artist 151
152	Artist 152
153	Artist 153
154	Artist 154
155	Artist 155
156	Artist 156
157	Artist 157
158	Artist 158
159	Artist 159
160	Artist 160
161	Artist 161
162	Artist 162
163	Artist 163
164	Artist 164
165	Artist 165
166	Artist 166
167	Artist 167
168	Artist 168
169	Artist 169
170	Artist 170
171	Artist 171
172	Artist 172
173	Artist 173
174	Artist 174
175	Artist 175
176	Artist 176
177	Artist 177
178	Artist 178
179	Artist 179
180	Artist 180
181	Artist 181
182	Artist 182
183	Artist 183
184	Artist 184
185	Artist 185
186	Artist 186
187	Artist 187
188	Artist 188
189	Artist 189
190	Artist 190
191	Artist 191
192	Artist 192
193	Artist 193
194	Artist 194
195	Artist 195
196	Artist 196
197	Artist 197
198	Artist 198
199	Artist 199
200	Artist 200
201	Artist 201
202	Artist 202
203	Artist 203
204	Artist 204
205	Artist 205
206	Artist 206
207	Artist 207
208	Artist 208
209	Artist 209
210	Artist 210
211	Artist 211
212	Artist 212
213	Artist 213
214	Artist 214
215	Artist 215
216	Artist 216
217	Artist 217
218	Artist 218
219	Artist 219
220	Artist 220
221	Artist 221
222	Artist 222
223	Artist 223
224	Artist 224
225	Artist 225
226	Artist 226
227	Artist 227
228	Artist 228
229	Artist 229
230	Artist 230
231	Artist 231
232	Artist 232
233	Artist 233
234	Artist 234
235	Artist 235
236	Artist 236
237	Artist 237
238	Artist 238
239	Artist 239
240	Artist 240
241	Artist 241
242	Artist 242
243	Artist 243
244	Artist 244
245	Artist 245
246	Artist 246
247	Artist 247
248	Artist 248
249	Artist 249
250	Artist 250
251	Artist 251
252	Artist 252
253	Artist 253
254	Artist 254
255	Artist 255
256	Artist 256
257	Artist 257
258	Artist 258
259	Artist 259
260	Artist 260
261	Artist 261
262	Artist 262
263	Artist 263
264	Artist 264
265	Artist 265
266	Artist 266
267	Artist 267
268	Artist 268
269	Artist 269
270	Artist 270
271	Artist 271
272	Artist 272
273	Artist 273
274	Artist 274
275	Artist 275
276	Artist 276
277	Artist 277
278	Artist 278
279	Artist 279
280	Artist 280
281	Artist 281
282	Artist 282
283	Artist 283
284	Artist 284
285	Artist 285
286	Artist 286
287	Artist 287
288	Artist 288
289	Artist 289
290	Artist 290
291	Artist 291
292	Artist 292
293	Artist 293
294	Artist 294
295	Artist 295
296	Artist 296
297	Artist 297
298	Artist 298
299	Artist 299
300	Artist 300
301	Artist 301
302	Artist 302
303	Artist 303
304	Artist 304
305	Artist 305
306	Artist 306
307	Artist 307
308	Artist 308
309	Artist 309
310	Artist 310
311	Artist 311
312	Artist 312
313	Artist 313
314	Artist 314
315	Artist 315
316	Artist 316
317	Artist 317
318	Artist 318
319	Artist 319
320	Artist 320
321	Artist 321
322	Artist 322
323	Artist 323
324	Artist 324
325	Artist 325
326	Artist 326
327	Artist 327
328	Artist 328
329	Artist 329
330	Artist 330
331	Artist 331
332	Artist 332
333	Artist 333
334	Artist 334
335	Artist 335
336	Artist 336
337	Artist 337
338	Artist 338
339	Artist 339
340	Artist 340
341	Artist 341
342	Artist 342
343	Artist 343
344	Artist 344
345	Artist 345
346	Artist 346
347	Artist 347
348	Artist 348
349	Artist 349
350	Artist 350
351	Artist 351
352	Artist 352
353	Artist 353
354	Artist 354
355	Artist 355
356	Artist 356
357	Artist 357
358	Artist 358
359	Artist 359
360	Artist 360
361	Artist 361
362	Artist 362
363	Artist 363
364	Artist 364
365	Artist 365
366	Artist 366
367	Artist 367
368	Artist 368
369	Artist 369
370	Artist 370
371	Artist 371
372	Artist 372
373	Artist 373
374	Artist 374
375	Artist 375
376	Artist 376
377	Artist 377
378	Artist 378
379	Artist 379
380	Artist 380
381	Artist 381
382	Artist 382
383	Artist 383
384	Artist 384
385	Artist 385
386	Artist 386
387	Artist 387
388	Artist 388
389	Artist 389
390	Artist 390
391	Artist 391
392	Artist 392
393	Artist 393
394	Artist 394
395	Artist 395
396	Artist 396
397	Artist 397
398	Artist 398
399	Artist 399
400	Artist 400
401	Artist 401
402	Artist 402
403	Artist 403
404	Artist 404
405	Artist 405
406	Artist 406
407	Artist 407
408	Artist 408
409	Artist 409
410	Artist 410
411	Artist 411
412	Artist 412
413	Artist 413
414	Artist 414
415	Artist 415
416	Artist 416
417	Artist 417
418	Artist 418
419	Artist 419
420	Artist 420
421	Artist 421
422	Artist 422
423	Artist 423
424	Artist 424
425	Artist 425
426	Artist 426
427	Artist 427
428	Artist 428
429	Artist 429
430	Artist 430
431	Artist 431
432	Artist 432
433	Artist 433
434	Artist 434
435	Artist 435
436	Artist 436
437	Artist 437
438	Artist 438
439	Artist 439
440	Artist 440
441	Artist 441
442	Artist 442
443	Artist 443
444	Artist 444
445	Artist 445
446	Artist 446
447	Artist 447
448	Artist 448
449	Artist 449
450	Artist 450
451	Artist 451
452	Artist 452
453	Artist 453
454	Artist 454
455	Artist 455
456	Artist 456
457	Artist 457
458	Artist 458
459	Artist 459
460	Artist 460
461	Artist 461
462	Artist 462
463	Artist 463
464	Artist 464
465	Artist 465
466	Artist 466
467	Artist 467
468	Artist 468
469	Artist 469
470	Artist 470
471	Artist 471
472	Artist 472
473	Artist 473
474	Artist 474
475	Artist 475
476	Artist 476
477	Artist 477
478	Artist 478
479	Artist 479
480	Artist 480
481	Artist 481
482	Artist 482
483	Artist 483
484	Artist 484
485	Artist 485
486	Artist 486
487	Artist 487
488	Artist 488
489	Artist 489
490	Artist 490
491	Artist 491
492	Artist 492
493	Artist 493
494	Artist 494
495	Artist 495
496	Artist 496
497	Artist 497
498	Artist 498
499	Artist 499
500	Artist 500
501	Artist 501
502	Artist 502
503	Artist 503
504	Artist 504
505	Artist 505
506	Artist 506
507	Artist 507
508	Artist 508
509	Artist 509
510	Artist 510
511	Artist 511
512	Artist 512
513	Artist 513
514	Artist 514
515	Artist 515
516	Artist 516
517	Artist 517
518	Artist 518
519	Artist 519
520	Artist 520
521	Artist 521
522	Artist 522
523	Artist 523
524	Artist 524
525	Artist 525
526	Artist 526
527	Artist 527
528	Artist 528
529	Artist 529
530	Artist 530
531	Artist 531
532	Artist 532
533	Artist 533
534	Artist 534
535	Artist 535
536	Artist 536
537	Artist 537
538	Artist 538
539	Artist 539
540	Artist 540
541	Artist 541
542	Artist 542
543	Artist 543
544	Artist 544
545	Artist 545
546	Artist 546
547	Artist 547
548	Artist 548
549	Artist 549
550	Artist 550
551	Artist 551
552	Artist 552
553	Artist 553
554	Artist 554
555	Artist 555
556	Artist 556
557	Artist 557
558	Artist 558
559	Artist 559
560	Artist 560
561	Artist 561
562	Artist 562
563	Artist 563
564	Artist 564
565	Artist 565
566	Artist 566
567	Artist 567
568	Artist 568
569	Artist 569
570	Artist 570
571	Artist 571
572	Artist 572
573	Artist 573
574	Artist 574
575	Artist 575
576	Artist 576
577	Artist 577
578	Artist 578
579	Artist 579
580	Artist 580
581	Artist 581
582	Artist 582
583	Artist 583
584	Artist 584
585	Artist 585
586	Artist 586
587	Artist 587
588	Artist 588
589	Artist 589
590	Artist 590
591	Artist 591
592	Artist 592
593	Artist 593
594	Artist 594
595	Artist 595
596	Artist 596
597	Artist 597
598	Artist 598
599	Artist 599
600	Artist 600
601	Artist 601
602	Artist 602
603	Artist 603
604	Artist 604
605	Artist 605
606	Artist 606
607	Artist 607
608	Artist 608
609	Artist 609
610	Artist 610
611	Artist 611
612	Artist 612
613	Artist 613
614	Artist 614
615	Artist 615
616	Artist 616
617	Artist 617
618	Artist 618
619	Artist 619
620	Artist 620
621	Artist 621
622	Artist 622
623	Artist 623
624	Artist 624
625	Artist 625
626	Artist 626
627	Artist 627
628	Artist 628
629	Artist 629
630	Artist 630
631	Artist 631
632	Artist 632
633	Artist 633
634	Artist 634
635	Artist 635
636	Artist 636
637	Artist 637
638	Artist 638
639	Artist 639
640	Artist 640
641	Artist 641
642	Artist 642
643	Artist 643
644	Artist 644
645	Artist 645
646	Artist 646
647	Artist 647
648	Artist 648
649	Artist 649
650	Artist 650
651	Artist 651
652	Artist 652
653	Artist 653
654	Artist 654
655	Artist 655
656	Artist 656
657	Artist 657
658	Artist 658
659	Artist 659
660	Artist 660
661	Artist 661
662	Artist 662
663	Artist 663
664	Artist 664
665	Artist 665
666	Artist 666
667	Artist 667
668	Artist 668
669	Artist 669
670	Artist 670
671	Artist 671
672	Artist 672
673	Artist 673
674	Artist 674
675	Artist 675
676	Artist 676
677	Artist 677
678	Artist 678
679	Artist 679
680	Artist 680
681	Artist 681
682	Artist 682
683	Artist 683
684	Artist 684
685	Artist 685
686	Artist 686
687	Artist 687
688	Artist 688
689	Artist 689
690	Artist 690
691	Artist 691
692	Artist 692
693	Artist 693
694	Artist 694
695	Artist 695
696	Artist 696
697	Artist 697
698	Artist 698
699	Artist 699
700	Artist 700
701	Artist 701
702	Artist 702
703	Artist 703
704	Artist 704
705	Artist 705
706	Artist 706
707	Artist 707
708	Artist 708
709	Artist 709
710	Artist 710
711	Artist 711
712	Artist 712
713	Artist 713
714	Artist 714
715	Artist 715
716	Artist 716
717	Artist 717
718	Artist 718
719	Artist 719
720	Artist 720
721	Artist 721
722	Artist 722
723	Artist 723
724	Artist 724
725	Artist 725
726	Artist 726
727	Artist 727
728	Artist 728
729	Artist 729
730	Artist 730
731	Artist 731
732	Artist 732
733	Artist 733
734	Artist 734
735	Artist 735
736	Artist 736
737	Artist 737
738	Artist 738
739	Artist 739
740	Artist 740
741	Artist 741
742	Artist 742
743	Artist 743
744	Artist 744
745	Artist 745
746	Artist 746
747	Artist 747
748	Artist 748
749	Artist 749
750	Artist 750
751	Artist 751
752	Artist 752
753	Artist 753
754	Artist 754
755	Artist 755
756	Artist 756
757	Artist 757
758	Artist 758
759	Artist 759
760	Artist 760
761	Artist 761
762	Artist 762
763	Artist 763
764	Artist 764
765	Artist 765
766	Artist 766
767	Artist 767
768	Artist 768
769	Artist 769
770	Artist 770
771	Artist 771
772	Artist 772
773	Artist 773
774	Artist 774
775	Artist 775
776	Artist 776
777	Artist 777
778	Artist 778
779	Artist 779
780	Artist 780
781	Artist 781
782	Artist 782
783	Artist 783
784	Artist 784
785	Artist 785
786	Artist 786
787	Artist 787
788	Artist 788
789	Artist 789
790	Artist 790
791	Artist 791
792	Artist 792
793	Artist 793
794	Artist 794
795	Artist 795
796	Artist 796
797	Artist 797
798	Artist 798
799	Artist 799
800	Artist 800
801	Artist 801
802	Artist 802
803	Artist 803
804	Artist 804
805	Artist 805
806	Artist 806
807	Artist 807
808	Artist 808
809	Artist 809
810	Artist 810
811	Artist 811
812	Artist 812
813	Artist 813
814	Artist 814
815	Artist 815
816	Artist 816
817	Artist 817
818	Artist 818
819	Artist 819
820	Artist 820
821	Artist 821
822	Artist 822
823	Artist 823
824	Artist 824
825	Artist 825
826	Artist 826
827	Artist 827
828	Artist 828
829	Artist 829
830	Artist 830
831	Artist 831
832	Artist 832
833	Artist 833
834	Artist 834
835	Artist 835
836	Artist 836
837	Artist 837
838	Artist 838
839	Artist 839
840	Artist 840
841	Artist 841
842	Artist 842
843	Artist 843
844	Artist 844
845	Artist 845
846	Artist 846
847	Artist 847
848	Artist 848
849	Artist 849
850	Artist 850
851	Artist 851
852	Artist 852
853	Artist 853
854	Artist 854
855	Artist 855
856	Artist 856
857	Artist 857
858	Artist 858
859	Artist 859
860	Artist 860
861	Artist 861
862	Artist 862
863	Artist 863
864	Artist 864
865	Artist 865
866	Artist 866
867	Artist 867
868	Artist 868
869	Artist 869
870	Artist 870
871	Artist 871
872	Artist 872
873	Artist 873
874	Artist 874
875	Artist 875
876	Artist 876
877	Artist 877
878	Artist 878
879	Artist 879
880	Artist 880
881	Artist 881
882	Artist 882
883	Artist 883
884	Artist 884
885	Artist 885
886	Artist 886
887	Artist 887
888	Artist 888
889	Artist 889
890	Artist 890
891	Artist 891
892	Artist 892
893	Artist 893
894	Artist 894
895	Artist 895
896	Artist 896
897	Artist 897
898	Artist 898
899	Artist 899
900	Artist 900
901	Artist 901
902	Artist 902
903	Artist 903
904	Artist 904
905	Artist 905
906	Artist 906
907	Artist 907
908	Artist 908
909	Artist 909
910	Artist 910
911	Artist 911
912	Artist 912
913	Artist 913
914	Artist 914
915	Artist 915
916	Artist 916
917	Artist 917
918	Artist 918
919	Artist 919
920	Artist 920
921	Artist 921
922	Artist 922
923	Artist 923
924	Artist 924
925	Artist 925
926	Artist 926
927	Artist 927
928	Artist 928
929	Artist 929
930	Artist 930
931	Artist 931
932	Artist 932
933	Artist 933
934	Artist 934
935	Artist 935
936	Artist 936
937	Artist 937
938	Artist 938
939	Artist 939
940	Artist 940
941	Artist 941
942	Artist 942
943	Artist 943
944	Artist 944
945	Artist 945
946	Artist 946
947	Artist 947
948	Artist 948
949	Artist 949
950	Artist 950
951	Artist 951
952	Artist 952
953	Artist 953
954	Artist 954
955	Artist 955
956	Artist 956
957	Artist 957
958	Artist 958
959	Artist 959
960	Artist 960
961	Artist 961
962	Artist 962
963	Artist 963
964	Artist 964
965	Artist 965
966	Artist 966
967	Artist 967
968	Artist 968
969	Artist 969
970	Artist 970
971	Artist 971
972	Artist 972
973	Artist 973
974	Artist 974
975	Artist 975
976	Artist 976
977	Artist 977
978	Artist 978
979	Artist 979
980	Artist 980
981	Artist 981
982	Artist 982
983	Artist 983
984	Artist 984
985	Artist 985
986	Artist 986
987	Artist 987
988	Artist 988
989	Artist 989
990	Artist 990
991	Artist 991
992	Artist 992
993	Artist 993
994	Artist 994
995	Artist 995
996	Artist 996
997	Artist 997
998	Artist 998
999	Artist 999
1000	Artist 1000
\.


--
-- TOC entry 3632 (class 0 OID 27008)
-- Dependencies: 216
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, title) FROM stdin;
1	Introduction to AI
2	Data Structures
3	Database Systems
4	Machine Learning
5	Computer Networks
6	Algorithms
7	Software Engineering
8	Operating Systems
9	Web Development
10	Cyber Security
11	Calculus 100
\.


--
-- TOC entry 3634 (class 0 OID 27022)
-- Dependencies: 218
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (emp_id, emp_name, age, salary) FROM stdin;
1	Employee 1	48	33036
2	Employee 2	45	58119
3	Employee 3	44	72469
4	Employee 4	56	77831
5	Employee 5	33	65361
6	Employee 6	51	71697
7	Employee 7	39	108168
8	Employee 8	26	54353
9	Employee 9	48	124223
10	Employee 10	33	34738
11	Employee 11	43	104704
12	Employee 12	21	67398
13	Employee 13	56	43001
14	Employee 14	52	72547
15	Employee 15	57	57279
16	Employee 16	46	100561
17	Employee 17	60	87927
18	Employee 18	51	100550
19	Employee 19	45	83994
20	Employee 20	59	71910
21	Employee 21	37	69790
22	Employee 22	51	72294
23	Employee 23	47	80648
24	Employee 24	44	92516
25	Employee 25	38	79465
26	Employee 26	50	44572
27	Employee 27	41	98891
28	Employee 28	23	43800
29	Employee 29	33	62690
30	Employee 30	43	35465
31	Employee 31	34	30592
32	Employee 32	56	39840
33	Employee 33	50	56259
34	Employee 34	21	102018
35	Employee 35	34	77559
36	Employee 36	48	113392
37	Employee 37	22	113303
38	Employee 38	59	84232
39	Employee 39	34	52255
40	Employee 40	58	124042
41	Employee 41	43	44778
42	Employee 42	25	127498
43	Employee 43	41	50125
44	Employee 44	22	92389
45	Employee 45	56	70936
46	Employee 46	44	63036
47	Employee 47	43	63464
48	Employee 48	34	85810
49	Employee 49	58	93664
50	Employee 50	37	97744
51	Employee 51	38	94519
52	Employee 52	49	85511
53	Employee 53	37	103887
54	Employee 54	49	62254
55	Employee 55	22	36126
56	Employee 56	52	48169
57	Employee 57	24	57211
58	Employee 58	42	103647
59	Employee 59	21	43475
60	Employee 60	37	40933
61	Employee 61	60	120504
62	Employee 62	41	101933
63	Employee 63	52	54837
64	Employee 64	47	44907
65	Employee 65	21	37719
66	Employee 66	47	121027
67	Employee 67	53	34368
68	Employee 68	36	109082
69	Employee 69	26	73310
70	Employee 70	53	45558
71	Employee 71	23	54159
72	Employee 72	57	36122
73	Employee 73	52	66418
74	Employee 74	25	43153
75	Employee 75	36	36446
76	Employee 76	35	99192
77	Employee 77	55	129404
78	Employee 78	52	107038
79	Employee 79	39	86067
80	Employee 80	40	97111
81	Employee 81	23	40805
82	Employee 82	57	89907
83	Employee 83	30	52787
84	Employee 84	30	30416
85	Employee 85	38	43891
86	Employee 86	58	78221
87	Employee 87	52	54288
88	Employee 88	23	58070
89	Employee 89	21	73299
90	Employee 90	57	83868
91	Employee 91	43	120057
92	Employee 92	43	121160
93	Employee 93	21	70827
94	Employee 94	27	48678
95	Employee 95	34	74837
96	Employee 96	31	104279
97	Employee 97	55	116453
98	Employee 98	26	45616
99	Employee 99	30	120987
100	Employee 100	58	70219
101	Employee 101	57	110723
102	Employee 102	41	35590
103	Employee 103	38	35251
104	Employee 104	55	122881
105	Employee 105	55	109872
106	Employee 106	23	100581
107	Employee 107	34	65578
108	Employee 108	37	95457
109	Employee 109	32	75427
110	Employee 110	24	122901
111	Employee 111	30	120803
112	Employee 112	52	123319
113	Employee 113	49	85343
114	Employee 114	22	112782
115	Employee 115	22	78469
116	Employee 116	39	120588
117	Employee 117	39	32054
118	Employee 118	35	98452
119	Employee 119	37	75494
120	Employee 120	20	86924
121	Employee 121	24	96879
122	Employee 122	55	109144
123	Employee 123	51	68203
124	Employee 124	25	61241
125	Employee 125	52	31049
126	Employee 126	47	48414
127	Employee 127	34	78322
128	Employee 128	52	54010
129	Employee 129	56	44824
130	Employee 130	54	74584
131	Employee 131	21	79555
132	Employee 132	46	86656
133	Employee 133	42	36459
134	Employee 134	59	57294
135	Employee 135	21	64939
136	Employee 136	29	101027
137	Employee 137	21	51563
138	Employee 138	28	100804
139	Employee 139	29	37780
140	Employee 140	47	123186
141	Employee 141	36	101617
142	Employee 142	30	33487
143	Employee 143	58	30968
144	Employee 144	31	101951
145	Employee 145	23	103752
146	Employee 146	36	51366
147	Employee 147	39	58141
148	Employee 148	24	46928
149	Employee 149	57	118710
150	Employee 150	36	33297
151	Employee 151	40	65463
152	Employee 152	50	80969
153	Employee 153	58	39785
154	Employee 154	45	54178
155	Employee 155	22	128699
156	Employee 156	52	93173
157	Employee 157	35	129873
158	Employee 158	52	104376
159	Employee 159	57	47133
160	Employee 160	58	61280
161	Employee 161	26	104131
162	Employee 162	35	118976
163	Employee 163	33	63637
164	Employee 164	33	117412
165	Employee 165	33	113982
166	Employee 166	44	113955
167	Employee 167	51	37245
168	Employee 168	39	92255
169	Employee 169	49	113772
170	Employee 170	50	34041
171	Employee 171	54	96931
172	Employee 172	42	75538
173	Employee 173	60	58804
174	Employee 174	40	121219
175	Employee 175	48	33993
176	Employee 176	45	126457
177	Employee 177	30	113918
178	Employee 178	51	56112
179	Employee 179	30	31186
180	Employee 180	33	86417
181	Employee 181	48	31953
182	Employee 182	24	95073
183	Employee 183	31	129005
184	Employee 184	34	44102
185	Employee 185	53	81366
186	Employee 186	58	122851
187	Employee 187	54	127657
188	Employee 188	36	63792
189	Employee 189	34	76302
190	Employee 190	40	30973
191	Employee 191	44	37782
192	Employee 192	54	100202
193	Employee 193	54	47272
194	Employee 194	33	65244
195	Employee 195	44	31099
196	Employee 196	22	112348
197	Employee 197	51	36694
198	Employee 198	57	92680
199	Employee 199	44	31179
200	Employee 200	35	41791
201	Employee 201	46	30155
202	Employee 202	28	55444
203	Employee 203	52	53299
204	Employee 204	22	104826
205	Employee 205	58	98514
206	Employee 206	44	95040
207	Employee 207	42	33332
208	Employee 208	25	87705
209	Employee 209	58	70524
210	Employee 210	39	117959
211	Employee 211	49	99904
212	Employee 212	44	37484
213	Employee 213	29	57795
214	Employee 214	25	63040
215	Employee 215	38	116273
216	Employee 216	53	97598
217	Employee 217	48	30476
218	Employee 218	59	40908
219	Employee 219	33	80221
220	Employee 220	35	35230
221	Employee 221	45	58860
222	Employee 222	51	47265
223	Employee 223	41	48501
224	Employee 224	35	113329
225	Employee 225	52	87565
226	Employee 226	42	112959
227	Employee 227	56	39587
228	Employee 228	30	84999
229	Employee 229	24	42800
230	Employee 230	58	33149
231	Employee 231	54	44411
232	Employee 232	47	99007
233	Employee 233	22	98646
234	Employee 234	46	65501
235	Employee 235	29	122947
236	Employee 236	30	46248
237	Employee 237	36	97671
238	Employee 238	46	31068
239	Employee 239	26	89294
240	Employee 240	55	76022
241	Employee 241	38	128543
242	Employee 242	59	127977
243	Employee 243	43	94547
244	Employee 244	52	121627
245	Employee 245	21	62454
246	Employee 246	47	99981
247	Employee 247	52	72606
248	Employee 248	57	53006
249	Employee 249	34	66875
250	Employee 250	25	39431
251	Employee 251	25	43803
252	Employee 252	52	112930
253	Employee 253	35	63351
254	Employee 254	27	59268
255	Employee 255	26	61521
256	Employee 256	35	116940
257	Employee 257	30	76164
258	Employee 258	40	76476
259	Employee 259	33	63491
260	Employee 260	51	80515
261	Employee 261	38	89212
262	Employee 262	27	72141
263	Employee 263	31	114987
264	Employee 264	30	61489
265	Employee 265	29	80031
266	Employee 266	42	47577
267	Employee 267	31	108329
268	Employee 268	50	113615
269	Employee 269	37	45636
270	Employee 270	51	110031
271	Employee 271	49	42845
272	Employee 272	45	43554
273	Employee 273	27	46220
274	Employee 274	33	34424
275	Employee 275	53	105399
276	Employee 276	23	31496
277	Employee 277	29	115340
278	Employee 278	50	88037
279	Employee 279	33	73151
280	Employee 280	46	75110
281	Employee 281	59	41141
282	Employee 282	47	98098
283	Employee 283	22	43622
284	Employee 284	28	40812
285	Employee 285	30	45303
286	Employee 286	37	128734
287	Employee 287	59	90901
288	Employee 288	57	92617
289	Employee 289	51	54709
290	Employee 290	52	106579
291	Employee 291	41	99213
292	Employee 292	55	81177
293	Employee 293	30	80067
294	Employee 294	33	48491
295	Employee 295	43	91140
296	Employee 296	38	61104
297	Employee 297	41	73202
298	Employee 298	41	100088
299	Employee 299	56	86552
300	Employee 300	34	106699
301	Employee 301	50	94152
302	Employee 302	32	43503
303	Employee 303	22	68531
304	Employee 304	44	75706
305	Employee 305	29	126234
306	Employee 306	29	37067
307	Employee 307	24	61491
308	Employee 308	24	91063
309	Employee 309	50	82465
310	Employee 310	39	30623
311	Employee 311	60	96241
312	Employee 312	24	75061
313	Employee 313	50	103071
314	Employee 314	36	96508
315	Employee 315	45	73416
316	Employee 316	49	45379
317	Employee 317	35	87703
318	Employee 318	60	99120
319	Employee 319	51	119291
320	Employee 320	42	49904
321	Employee 321	31	115939
322	Employee 322	48	115559
323	Employee 323	34	104712
324	Employee 324	31	47193
325	Employee 325	26	61776
326	Employee 326	26	83939
327	Employee 327	38	117675
328	Employee 328	58	71920
329	Employee 329	40	57354
330	Employee 330	28	101073
331	Employee 331	41	58338
332	Employee 332	33	101630
333	Employee 333	25	57335
334	Employee 334	35	55489
335	Employee 335	26	47842
336	Employee 336	22	85344
337	Employee 337	28	88464
338	Employee 338	51	73985
339	Employee 339	47	56192
340	Employee 340	45	52240
341	Employee 341	45	107609
342	Employee 342	57	37527
343	Employee 343	29	103930
344	Employee 344	25	43156
345	Employee 345	21	41414
346	Employee 346	54	84627
347	Employee 347	53	109659
348	Employee 348	39	94572
349	Employee 349	42	66060
350	Employee 350	39	58449
351	Employee 351	53	105755
352	Employee 352	47	125514
353	Employee 353	50	109807
354	Employee 354	37	118936
355	Employee 355	27	95716
356	Employee 356	38	77276
357	Employee 357	42	88652
358	Employee 358	43	49378
359	Employee 359	25	52457
360	Employee 360	45	114863
361	Employee 361	54	126666
362	Employee 362	29	125216
363	Employee 363	43	90367
364	Employee 364	44	113123
365	Employee 365	45	31416
366	Employee 366	41	60668
367	Employee 367	49	123538
368	Employee 368	30	81864
369	Employee 369	20	88285
370	Employee 370	48	39060
371	Employee 371	40	57920
372	Employee 372	55	87412
373	Employee 373	27	96955
374	Employee 374	45	86804
375	Employee 375	37	37712
376	Employee 376	39	82171
377	Employee 377	55	83919
378	Employee 378	34	124603
379	Employee 379	31	70715
380	Employee 380	40	35727
381	Employee 381	37	125205
382	Employee 382	58	108092
383	Employee 383	60	39209
384	Employee 384	55	103516
385	Employee 385	34	101501
386	Employee 386	25	78657
387	Employee 387	25	91160
388	Employee 388	25	110050
389	Employee 389	58	64399
390	Employee 390	51	46558
391	Employee 391	43	93121
392	Employee 392	50	98145
393	Employee 393	30	64144
394	Employee 394	38	92537
395	Employee 395	49	109691
396	Employee 396	47	82003
397	Employee 397	27	129630
398	Employee 398	37	104242
399	Employee 399	35	74821
400	Employee 400	37	111612
401	Employee 401	45	81522
402	Employee 402	35	100164
403	Employee 403	31	75414
404	Employee 404	24	112715
405	Employee 405	22	126202
406	Employee 406	56	120897
407	Employee 407	32	93921
408	Employee 408	45	38377
409	Employee 409	40	60494
410	Employee 410	54	96089
411	Employee 411	53	77840
412	Employee 412	34	53535
413	Employee 413	54	54843
414	Employee 414	46	41156
415	Employee 415	46	47773
416	Employee 416	51	40674
417	Employee 417	45	82050
418	Employee 418	54	76087
419	Employee 419	33	93333
420	Employee 420	34	108589
421	Employee 421	50	101576
422	Employee 422	49	89668
423	Employee 423	47	109580
424	Employee 424	34	113499
425	Employee 425	49	69133
426	Employee 426	45	103498
427	Employee 427	25	81267
428	Employee 428	36	48740
429	Employee 429	51	91735
430	Employee 430	30	76824
431	Employee 431	43	111198
432	Employee 432	28	89416
433	Employee 433	41	64874
434	Employee 434	29	38735
435	Employee 435	21	44417
436	Employee 436	32	109249
437	Employee 437	57	70450
438	Employee 438	23	104832
439	Employee 439	28	34119
440	Employee 440	55	44818
441	Employee 441	31	119529
442	Employee 442	57	70993
443	Employee 443	41	100594
444	Employee 444	31	73359
445	Employee 445	43	126580
446	Employee 446	32	45566
447	Employee 447	52	76185
448	Employee 448	40	105027
449	Employee 449	26	120680
450	Employee 450	33	52669
451	Employee 451	45	84872
452	Employee 452	43	93969
453	Employee 453	54	57946
454	Employee 454	32	109858
455	Employee 455	58	61906
456	Employee 456	35	65224
457	Employee 457	38	111934
458	Employee 458	37	116535
459	Employee 459	50	45749
460	Employee 460	39	121733
461	Employee 461	51	97113
462	Employee 462	28	45590
463	Employee 463	23	106746
464	Employee 464	28	114807
465	Employee 465	43	126347
466	Employee 466	31	63432
467	Employee 467	40	76827
468	Employee 468	53	119751
469	Employee 469	60	115328
470	Employee 470	59	96901
471	Employee 471	47	61194
472	Employee 472	27	82488
473	Employee 473	31	96976
474	Employee 474	25	111926
475	Employee 475	43	108575
476	Employee 476	50	84687
477	Employee 477	43	93267
478	Employee 478	38	102678
479	Employee 479	39	75572
480	Employee 480	24	112247
481	Employee 481	48	120697
482	Employee 482	57	59923
483	Employee 483	26	57282
484	Employee 484	56	39281
485	Employee 485	30	84058
486	Employee 486	48	76649
487	Employee 487	44	69599
488	Employee 488	44	60477
489	Employee 489	39	122384
490	Employee 490	56	101307
491	Employee 491	25	102253
492	Employee 492	40	117282
493	Employee 493	46	115883
494	Employee 494	22	44770
495	Employee 495	21	32730
496	Employee 496	25	48974
497	Employee 497	36	49188
498	Employee 498	31	94798
499	Employee 499	23	126615
500	Employee 500	57	58894
501	Employee 501	48	80161
502	Employee 502	36	105247
503	Employee 503	54	76473
504	Employee 504	54	73100
505	Employee 505	23	42942
506	Employee 506	50	48216
507	Employee 507	26	63860
508	Employee 508	20	45315
509	Employee 509	53	44953
510	Employee 510	51	32228
511	Employee 511	35	32843
512	Employee 512	28	42051
513	Employee 513	24	49007
514	Employee 514	23	113695
515	Employee 515	38	30159
516	Employee 516	40	49120
517	Employee 517	24	45237
518	Employee 518	40	116768
519	Employee 519	25	76193
520	Employee 520	56	94568
521	Employee 521	27	32646
522	Employee 522	57	116749
523	Employee 523	31	56011
524	Employee 524	53	35713
525	Employee 525	36	66276
526	Employee 526	52	67748
527	Employee 527	28	94916
528	Employee 528	40	71590
529	Employee 529	30	80534
530	Employee 530	30	81406
531	Employee 531	29	63974
532	Employee 532	31	72998
533	Employee 533	31	104989
534	Employee 534	36	113890
535	Employee 535	23	65186
536	Employee 536	57	93979
537	Employee 537	45	126004
538	Employee 538	45	119697
539	Employee 539	36	33602
540	Employee 540	45	106057
541	Employee 541	25	50046
542	Employee 542	26	101861
543	Employee 543	31	95832
544	Employee 544	21	64880
545	Employee 545	24	36094
546	Employee 546	39	114247
547	Employee 547	40	117044
548	Employee 548	37	58378
549	Employee 549	50	77319
550	Employee 550	28	112945
551	Employee 551	46	33739
552	Employee 552	57	96230
553	Employee 553	35	108981
554	Employee 554	60	126772
555	Employee 555	50	44045
556	Employee 556	46	129639
557	Employee 557	44	123767
558	Employee 558	49	59409
559	Employee 559	46	40360
560	Employee 560	21	38677
561	Employee 561	52	64080
562	Employee 562	47	127475
563	Employee 563	42	111459
564	Employee 564	58	62031
565	Employee 565	26	120426
566	Employee 566	56	64956
567	Employee 567	29	93183
568	Employee 568	31	57319
569	Employee 569	28	42653
570	Employee 570	56	38073
571	Employee 571	48	67405
572	Employee 572	28	104298
573	Employee 573	23	88141
574	Employee 574	46	66791
575	Employee 575	48	104995
576	Employee 576	37	60501
577	Employee 577	50	37105
578	Employee 578	57	38694
579	Employee 579	44	61094
580	Employee 580	52	92968
581	Employee 581	31	94324
582	Employee 582	41	110253
583	Employee 583	23	95847
584	Employee 584	52	115655
585	Employee 585	50	120114
586	Employee 586	22	106442
587	Employee 587	31	87912
588	Employee 588	33	106769
589	Employee 589	39	91782
590	Employee 590	48	35211
591	Employee 591	22	102074
592	Employee 592	26	60654
593	Employee 593	22	51472
594	Employee 594	44	114986
595	Employee 595	36	55003
596	Employee 596	46	88744
597	Employee 597	59	101968
598	Employee 598	54	116446
599	Employee 599	56	56167
600	Employee 600	40	127190
601	Employee 601	37	79903
602	Employee 602	60	105670
603	Employee 603	27	66779
604	Employee 604	25	42470
605	Employee 605	39	109717
606	Employee 606	45	43905
607	Employee 607	31	71346
608	Employee 608	30	122503
609	Employee 609	56	98672
610	Employee 610	51	38938
611	Employee 611	33	54224
612	Employee 612	38	33643
613	Employee 613	31	87733
614	Employee 614	39	66716
615	Employee 615	45	95341
616	Employee 616	59	46656
617	Employee 617	26	34956
618	Employee 618	23	57649
619	Employee 619	54	30375
620	Employee 620	23	35703
621	Employee 621	38	79608
622	Employee 622	43	77786
623	Employee 623	45	32522
624	Employee 624	44	34975
625	Employee 625	28	91047
626	Employee 626	60	40317
627	Employee 627	36	45311
628	Employee 628	25	128588
629	Employee 629	48	52404
630	Employee 630	47	81580
631	Employee 631	54	91442
632	Employee 632	59	43748
633	Employee 633	44	62067
634	Employee 634	39	33677
635	Employee 635	50	78545
636	Employee 636	29	106348
637	Employee 637	51	42189
638	Employee 638	45	56347
639	Employee 639	58	59127
640	Employee 640	22	74141
641	Employee 641	37	123630
642	Employee 642	47	87016
643	Employee 643	40	55618
644	Employee 644	56	38121
645	Employee 645	54	45021
646	Employee 646	54	33329
647	Employee 647	50	106552
648	Employee 648	56	64942
649	Employee 649	50	41931
650	Employee 650	43	41688
651	Employee 651	40	50056
652	Employee 652	50	95838
653	Employee 653	22	93873
654	Employee 654	58	43685
655	Employee 655	50	71802
656	Employee 656	51	84420
657	Employee 657	60	47184
658	Employee 658	47	102374
659	Employee 659	24	93977
660	Employee 660	58	62556
661	Employee 661	24	93600
662	Employee 662	40	97382
663	Employee 663	49	74665
664	Employee 664	56	105962
665	Employee 665	22	88092
666	Employee 666	22	85055
667	Employee 667	23	108895
668	Employee 668	52	112405
669	Employee 669	48	57552
670	Employee 670	31	80151
671	Employee 671	60	36117
672	Employee 672	49	129125
673	Employee 673	20	116177
674	Employee 674	55	31228
675	Employee 675	58	74117
676	Employee 676	27	34927
677	Employee 677	29	94587
678	Employee 678	33	48843
679	Employee 679	50	111590
680	Employee 680	21	52272
681	Employee 681	41	114801
682	Employee 682	32	86157
683	Employee 683	43	91810
684	Employee 684	41	90876
685	Employee 685	40	101030
686	Employee 686	50	71483
687	Employee 687	46	124139
688	Employee 688	51	114627
689	Employee 689	22	109320
690	Employee 690	20	117307
691	Employee 691	25	73660
692	Employee 692	49	46747
693	Employee 693	49	35523
694	Employee 694	36	44534
695	Employee 695	44	97465
696	Employee 696	50	117617
697	Employee 697	49	81108
698	Employee 698	33	37026
699	Employee 699	31	124997
700	Employee 700	45	129438
701	Employee 701	38	114065
702	Employee 702	30	39390
703	Employee 703	37	87426
704	Employee 704	47	110286
705	Employee 705	24	93323
706	Employee 706	49	80556
707	Employee 707	24	104903
708	Employee 708	21	104107
709	Employee 709	41	95794
710	Employee 710	36	65257
711	Employee 711	25	32860
712	Employee 712	44	53140
713	Employee 713	54	56389
714	Employee 714	43	44781
715	Employee 715	34	111756
716	Employee 716	43	78301
717	Employee 717	55	129162
718	Employee 718	31	91340
719	Employee 719	30	83886
720	Employee 720	51	49763
721	Employee 721	49	44779
722	Employee 722	24	127314
723	Employee 723	20	89803
724	Employee 724	36	78900
725	Employee 725	25	99482
726	Employee 726	35	50013
727	Employee 727	27	30156
728	Employee 728	22	114496
729	Employee 729	39	129116
730	Employee 730	51	57885
731	Employee 731	26	122309
732	Employee 732	35	90713
733	Employee 733	26	106058
734	Employee 734	28	33883
735	Employee 735	21	62608
736	Employee 736	57	80476
737	Employee 737	25	52550
738	Employee 738	30	57725
739	Employee 739	40	52365
740	Employee 740	44	73353
741	Employee 741	49	75545
742	Employee 742	35	89381
743	Employee 743	51	118763
744	Employee 744	56	96753
745	Employee 745	58	74762
746	Employee 746	50	83030
747	Employee 747	42	88329
748	Employee 748	42	123559
749	Employee 749	30	65624
750	Employee 750	55	53357
751	Employee 751	23	51886
752	Employee 752	42	33841
753	Employee 753	27	49604
754	Employee 754	33	53587
755	Employee 755	28	99806
756	Employee 756	40	91237
757	Employee 757	30	43291
758	Employee 758	31	73071
759	Employee 759	38	90374
760	Employee 760	59	31445
761	Employee 761	23	116100
762	Employee 762	41	39399
763	Employee 763	55	127487
764	Employee 764	36	122659
765	Employee 765	57	65886
766	Employee 766	55	35496
767	Employee 767	32	66594
768	Employee 768	23	75605
769	Employee 769	51	79784
770	Employee 770	34	129231
771	Employee 771	51	118589
772	Employee 772	29	66776
773	Employee 773	21	58017
774	Employee 774	41	115114
775	Employee 775	36	111341
776	Employee 776	28	64746
777	Employee 777	52	58174
778	Employee 778	49	77017
779	Employee 779	28	33165
780	Employee 780	60	51957
781	Employee 781	55	69236
782	Employee 782	43	100763
783	Employee 783	47	123706
784	Employee 784	32	87124
785	Employee 785	26	99081
786	Employee 786	35	59845
787	Employee 787	53	82940
788	Employee 788	30	104529
789	Employee 789	26	57997
790	Employee 790	31	66857
791	Employee 791	33	59457
792	Employee 792	42	59342
793	Employee 793	39	31548
794	Employee 794	32	113056
795	Employee 795	31	60362
796	Employee 796	30	128258
797	Employee 797	26	96100
798	Employee 798	30	62208
799	Employee 799	59	103321
800	Employee 800	32	72647
801	Employee 801	50	38553
802	Employee 802	60	72718
803	Employee 803	57	40352
804	Employee 804	49	93245
805	Employee 805	53	46710
806	Employee 806	28	127806
807	Employee 807	31	120860
808	Employee 808	43	52290
809	Employee 809	37	54798
810	Employee 810	30	64953
811	Employee 811	55	107018
812	Employee 812	52	121819
813	Employee 813	45	80917
814	Employee 814	26	78270
815	Employee 815	39	102114
816	Employee 816	47	52384
817	Employee 817	24	36275
818	Employee 818	49	113035
819	Employee 819	54	80953
820	Employee 820	53	80641
821	Employee 821	57	53485
822	Employee 822	51	58448
823	Employee 823	32	60353
824	Employee 824	48	30945
825	Employee 825	46	91772
826	Employee 826	26	53194
827	Employee 827	22	87012
828	Employee 828	35	39679
829	Employee 829	24	116207
830	Employee 830	52	71095
831	Employee 831	28	123127
832	Employee 832	23	60460
833	Employee 833	33	107181
834	Employee 834	22	124439
835	Employee 835	28	97665
836	Employee 836	26	120077
837	Employee 837	27	98347
838	Employee 838	49	44005
839	Employee 839	51	90088
840	Employee 840	42	45486
841	Employee 841	23	40081
842	Employee 842	49	40216
843	Employee 843	51	57115
844	Employee 844	42	111117
845	Employee 845	49	40668
846	Employee 846	41	74376
847	Employee 847	38	102405
848	Employee 848	32	121135
849	Employee 849	21	90940
850	Employee 850	34	71905
851	Employee 851	21	90517
852	Employee 852	24	87973
853	Employee 853	44	59239
854	Employee 854	44	69732
855	Employee 855	54	82454
856	Employee 856	27	43256
857	Employee 857	29	45974
858	Employee 858	54	49002
859	Employee 859	30	109424
860	Employee 860	59	89653
861	Employee 861	28	122773
862	Employee 862	51	44230
863	Employee 863	32	64453
864	Employee 864	50	71313
865	Employee 865	40	98722
866	Employee 866	50	75025
867	Employee 867	32	57127
868	Employee 868	22	79529
869	Employee 869	36	119567
870	Employee 870	45	108443
871	Employee 871	52	32167
872	Employee 872	23	80915
873	Employee 873	54	80921
874	Employee 874	45	105857
875	Employee 875	37	46439
876	Employee 876	32	70514
877	Employee 877	47	106881
878	Employee 878	41	125167
879	Employee 879	22	36175
880	Employee 880	29	51451
881	Employee 881	52	64861
882	Employee 882	40	41730
883	Employee 883	35	48076
884	Employee 884	52	101483
885	Employee 885	31	68994
886	Employee 886	25	49543
887	Employee 887	41	62872
888	Employee 888	21	67722
889	Employee 889	51	72709
890	Employee 890	44	103726
891	Employee 891	54	48237
892	Employee 892	38	40922
893	Employee 893	58	115462
894	Employee 894	25	128499
895	Employee 895	40	122443
896	Employee 896	52	80276
897	Employee 897	24	94231
898	Employee 898	30	108724
899	Employee 899	33	126190
900	Employee 900	35	129739
901	Employee 901	38	45202
902	Employee 902	29	59391
903	Employee 903	27	80227
904	Employee 904	35	86681
905	Employee 905	46	123526
906	Employee 906	30	90842
907	Employee 907	43	109619
908	Employee 908	32	114204
909	Employee 909	42	64247
910	Employee 910	51	41812
911	Employee 911	33	35576
912	Employee 912	58	121371
913	Employee 913	30	122427
914	Employee 914	28	35443
915	Employee 915	37	37898
916	Employee 916	53	69837
917	Employee 917	47	73846
918	Employee 918	50	71830
919	Employee 919	33	95058
920	Employee 920	60	34722
921	Employee 921	45	97454
922	Employee 922	40	46339
923	Employee 923	57	46631
924	Employee 924	54	97191
925	Employee 925	49	46332
926	Employee 926	25	92891
927	Employee 927	30	128115
928	Employee 928	59	49239
929	Employee 929	27	101066
930	Employee 930	29	52498
931	Employee 931	50	70562
932	Employee 932	34	61293
933	Employee 933	46	89931
934	Employee 934	52	74104
935	Employee 935	33	91596
936	Employee 936	31	99862
937	Employee 937	25	31000
938	Employee 938	25	87139
939	Employee 939	54	109847
940	Employee 940	36	127425
941	Employee 941	36	93034
942	Employee 942	23	71495
943	Employee 943	47	112945
944	Employee 944	36	90517
945	Employee 945	46	91353
946	Employee 946	48	42842
947	Employee 947	22	40970
948	Employee 948	40	128260
949	Employee 949	46	42486
950	Employee 950	35	74575
951	Employee 951	23	51489
952	Employee 952	52	41004
953	Employee 953	29	96830
954	Employee 954	32	59053
955	Employee 955	22	85283
956	Employee 956	37	58910
957	Employee 957	40	38056
958	Employee 958	32	105004
959	Employee 959	29	66887
960	Employee 960	41	110917
961	Employee 961	50	128709
962	Employee 962	37	66871
963	Employee 963	44	113226
964	Employee 964	27	66623
965	Employee 965	35	71138
966	Employee 966	36	71318
967	Employee 967	46	64518
968	Employee 968	34	52814
969	Employee 969	57	102933
970	Employee 970	58	40453
971	Employee 971	33	40505
972	Employee 972	30	46157
973	Employee 973	31	122668
974	Employee 974	48	122967
975	Employee 975	38	64235
976	Employee 976	34	126428
977	Employee 977	59	96840
978	Employee 978	56	87632
979	Employee 979	57	47269
980	Employee 980	49	110853
981	Employee 981	37	78811
982	Employee 982	41	38894
983	Employee 983	51	31673
984	Employee 984	33	116933
985	Employee 985	59	127220
986	Employee 986	48	44207
987	Employee 987	33	50060
988	Employee 988	37	77214
989	Employee 989	58	94192
990	Employee 990	41	86585
991	Employee 991	26	69542
992	Employee 992	60	123633
993	Employee 993	33	95548
994	Employee 994	55	49560
995	Employee 995	43	125317
996	Employee 996	21	103384
997	Employee 997	42	65541
998	Employee 998	57	48654
999	Employee 999	54	61493
1000	Employee 1000	34	91298
\.


--
-- TOC entry 3636 (class 0 OID 27032)
-- Dependencies: 220
-- Data for Name: login_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_info (id, employee_id) FROM stdin;
1	974
2	810
3	53
4	231
5	8
6	628
7	694
8	470
9	517
10	606
11	787
12	616
13	989
14	902
15	872
16	534
17	738
18	119
19	999
20	520
21	145
22	441
23	333
24	600
25	293
26	86
27	248
28	281
29	359
30	106
31	393
32	917
33	853
34	892
35	626
36	707
37	716
38	206
39	774
40	589
41	644
42	463
43	188
44	967
45	752
46	74
47	254
48	352
49	389
50	988
51	520
52	535
53	127
54	399
55	461
56	665
57	852
58	214
59	673
60	583
61	912
62	720
63	891
64	304
65	234
66	519
67	663
68	802
69	272
70	16
71	303
72	751
73	126
74	527
75	95
76	157
77	85
78	432
79	281
80	917
81	590
82	916
83	148
84	725
85	930
86	513
87	305
88	937
89	605
90	458
91	214
92	392
93	477
94	132
95	57
96	849
97	717
98	464
99	608
100	260
101	717
102	498
103	601
104	937
105	243
106	77
107	734
108	708
109	244
110	476
111	719
112	68
113	702
114	904
115	51
116	724
117	737
118	225
119	828
120	272
121	538
122	512
123	359
124	59
125	50
126	837
127	274
128	526
129	232
130	191
131	991
132	173
133	968
134	798
135	409
136	753
137	470
138	272
139	536
140	923
141	547
142	721
143	548
144	183
145	175
146	935
147	208
148	593
149	4
150	494
151	540
152	957
153	408
154	255
155	726
156	205
157	382
158	83
159	310
160	963
161	953
162	700
163	633
164	902
165	448
166	256
167	67
168	680
169	457
170	524
171	236
172	552
173	33
174	163
175	424
176	225
177	219
178	881
179	153
180	813
181	912
182	209
183	894
184	465
185	982
186	32
187	322
188	113
189	882
190	567
191	165
192	784
193	360
194	913
195	405
196	861
197	767
198	645
199	240
200	339
201	740
202	835
203	354
204	163
205	404
206	439
207	730
208	50
209	213
210	889
211	25
212	740
213	737
214	409
215	185
216	528
217	134
218	469
219	300
220	315
221	76
222	273
223	589
224	961
225	926
226	808
227	890
228	826
229	241
230	231
231	419
232	7
233	788
234	507
235	136
236	408
237	793
238	644
239	723
240	135
241	185
242	106
243	254
244	997
245	866
246	222
247	442
248	247
249	675
250	714
251	854
252	224
253	129
254	429
255	102
256	8
257	32
258	951
259	837
260	179
261	136
262	542
263	993
264	220
265	373
266	391
267	817
268	583
269	837
270	198
271	722
272	422
273	992
274	829
275	224
276	46
277	419
278	623
279	131
280	312
281	881
282	90
283	19
284	867
285	525
286	580
287	604
288	891
289	518
290	467
291	262
292	993
293	894
294	489
295	111
296	986
297	311
298	285
299	943
300	624
301	120
302	114
303	643
304	535
305	924
306	645
307	707
308	879
309	909
310	208
311	113
312	405
313	654
314	415
315	587
316	111
317	256
318	301
319	639
320	882
321	615
322	981
323	162
324	78
325	527
326	506
327	719
328	298
329	820
330	640
331	266
332	284
333	160
334	353
335	347
336	442
337	207
338	456
339	836
340	333
341	657
342	728
343	672
344	682
345	399
346	986
347	940
348	867
349	238
350	505
351	442
352	761
353	533
354	894
355	80
356	894
357	162
358	306
359	265
360	842
361	747
362	817
363	686
364	785
365	447
366	784
367	133
368	562
369	641
370	771
371	612
372	797
373	347
374	190
375	371
376	148
377	479
378	913
379	768
380	472
381	783
382	747
383	281
384	586
385	823
386	59
387	728
388	345
389	156
390	413
391	462
392	78
393	967
394	577
395	872
396	629
397	850
398	792
399	667
400	295
401	541
402	23
403	390
404	391
405	849
406	742
407	17
408	203
409	114
410	600
411	625
412	731
413	76
414	970
415	444
416	296
417	661
418	824
419	644
420	468
421	587
422	328
423	508
424	493
425	412
426	420
427	106
428	329
429	293
430	778
431	409
432	479
433	435
434	273
435	223
436	670
437	942
438	32
439	894
440	732
441	778
442	776
443	604
444	184
445	428
446	964
447	27
448	772
449	545
450	116
451	214
452	558
453	224
454	757
455	90
456	605
457	21
458	190
459	105
460	900
461	406
462	560
463	413
464	980
465	755
466	911
467	966
468	796
469	946
470	118
471	887
472	891
473	110
474	284
475	604
476	990
477	386
478	997
479	431
480	971
481	975
482	19
483	425
484	35
485	664
486	438
487	47
488	133
489	771
490	153
491	12
492	517
493	456
494	484
495	579
496	847
497	160
498	852
499	505
500	349
501	915
502	774
503	117
504	194
505	523
506	214
507	506
508	924
509	647
510	32
511	646
512	186
513	998
514	594
515	382
516	831
517	356
518	68
519	809
520	248
521	102
522	139
523	90
524	419
525	284
526	86
527	112
528	327
529	347
530	789
531	805
532	498
533	606
534	91
535	268
536	759
537	759
538	955
539	427
540	239
541	601
542	874
543	143
544	687
545	987
546	420
547	409
548	681
549	27
550	322
551	367
552	511
553	696
554	254
555	182
556	75
557	732
558	730
559	554
560	173
561	800
562	136
563	495
564	663
565	855
566	13
567	727
568	501
569	207
570	363
571	752
572	814
573	780
574	661
575	553
576	490
577	597
578	125
579	823
580	825
581	21
582	985
583	241
584	976
585	653
586	286
587	907
588	768
589	564
590	542
591	155
592	648
593	935
594	829
595	492
596	58
597	910
598	11
599	275
600	854
601	732
602	720
603	253
604	415
605	838
606	564
607	604
608	232
609	351
610	160
611	347
612	419
613	366
614	474
615	539
616	867
617	943
618	221
619	409
620	687
621	442
622	730
623	939
624	445
625	387
626	128
627	925
628	209
629	387
630	281
631	176
632	57
633	763
634	146
635	70
636	325
637	463
638	848
639	147
640	259
641	90
642	519
643	947
644	789
645	482
646	258
647	387
648	679
649	762
650	484
651	935
652	806
653	475
654	616
655	839
656	936
657	971
658	879
659	128
660	859
661	464
662	92
663	646
664	550
665	10
666	410
667	36
668	614
669	624
670	770
671	948
672	595
673	896
674	583
675	7
676	367
677	128
678	107
679	618
680	695
681	119
682	599
683	391
684	534
685	241
686	449
687	894
688	286
689	27
690	520
691	416
692	355
693	635
694	406
695	691
696	422
697	906
698	842
699	326
700	55
701	291
702	928
703	233
704	967
705	69
706	335
707	869
708	101
709	777
710	872
711	290
712	761
713	450
714	782
715	29
716	985
717	5
718	488
719	156
720	273
721	777
722	692
723	263
724	27
725	25
726	277
727	677
728	343
729	649
730	201
731	448
732	641
733	264
734	486
735	87
736	999
737	761
738	370
739	797
740	77
741	596
742	382
743	983
744	807
745	630
746	251
747	755
748	850
749	302
750	981
751	357
752	685
753	833
754	642
755	702
756	579
757	119
758	41
759	96
760	967
761	749
762	213
763	724
764	577
765	61
766	375
767	700
768	977
769	325
770	18
771	486
772	478
773	938
774	260
775	209
776	213
777	45
778	850
779	641
780	480
781	316
782	174
783	921
784	15
785	162
786	618
787	544
788	727
789	234
790	572
791	719
792	799
793	574
794	246
795	665
796	661
797	786
798	139
799	436
800	645
801	571
802	280
803	923
804	5
805	204
806	424
807	418
808	554
809	552
810	802
811	276
812	15
813	153
814	458
815	451
816	772
817	111
818	353
819	281
820	139
821	243
822	839
823	790
824	813
825	91
826	15
827	398
828	204
829	612
830	638
831	156
832	68
833	533
834	830
835	928
836	600
837	272
838	709
839	640
840	521
841	128
842	669
843	735
844	210
845	169
846	405
847	374
848	825
849	423
850	175
851	847
852	744
853	944
854	937
855	19
856	609
857	275
858	222
859	991
860	107
861	465
862	975
863	565
864	790
865	242
866	962
867	520
868	107
869	104
870	911
871	119
872	215
873	81
874	736
875	409
876	853
877	587
878	23
879	598
880	524
881	767
882	534
883	240
884	646
885	110
886	327
887	142
888	580
889	998
890	912
891	545
892	669
893	83
894	428
895	507
896	404
897	732
898	675
899	450
900	256
901	640
902	54
903	496
904	902
905	347
906	709
907	136
908	209
909	391
910	741
911	687
912	891
913	605
914	873
915	123
916	299
917	572
918	499
919	154
920	695
921	154
922	910
923	321
924	72
925	218
926	265
927	111
928	217
929	585
930	462
931	61
932	150
933	703
934	613
935	440
936	209
937	134
938	286
939	331
940	921
941	516
942	286
943	675
944	46
945	541
946	308
947	471
948	353
949	614
950	942
951	408
952	449
953	187
954	119
955	540
956	839
957	705
958	340
959	991
960	215
961	729
962	354
963	841
964	135
965	589
966	460
967	791
968	581
969	174
970	994
971	926
972	127
973	194
974	859
975	325
976	772
977	217
978	929
979	341
980	854
981	147
982	768
983	930
984	490
985	482
986	240
987	810
988	529
989	495
990	646
991	517
992	486
993	199
994	423
995	91
996	385
997	920
998	951
999	795
1000	413
\.


--
-- TOC entry 3639 (class 0 OID 27115)
-- Dependencies: 223
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (playlist_id, playlist_name, song_id) FROM stdin;
1	Playlist 1	426
2	Playlist 2	741
3	Playlist 3	584
4	Playlist 4	28
5	Playlist 5	354
6	Playlist 6	355
7	Playlist 7	722
8	Playlist 8	698
9	Playlist 9	83
10	Playlist 10	344
11	Playlist 11	160
12	Playlist 12	536
13	Playlist 13	543
14	Playlist 14	601
15	Playlist 15	746
16	Playlist 16	21
17	Playlist 17	58
18	Playlist 18	751
19	Playlist 19	158
20	Playlist 20	375
21	Playlist 21	470
22	Playlist 22	418
23	Playlist 23	774
24	Playlist 24	654
25	Playlist 25	295
26	Playlist 26	106
27	Playlist 27	811
28	Playlist 28	575
29	Playlist 29	371
30	Playlist 30	330
31	Playlist 31	89
32	Playlist 32	650
33	Playlist 33	697
34	Playlist 34	592
35	Playlist 35	886
36	Playlist 36	699
37	Playlist 37	754
38	Playlist 38	608
39	Playlist 39	308
40	Playlist 40	474
41	Playlist 41	598
42	Playlist 42	188
43	Playlist 43	541
44	Playlist 44	746
45	Playlist 45	416
46	Playlist 46	101
47	Playlist 47	875
48	Playlist 48	726
49	Playlist 49	111
50	Playlist 50	293
51	Playlist 51	797
52	Playlist 52	196
53	Playlist 53	774
54	Playlist 54	951
55	Playlist 55	576
56	Playlist 56	572
57	Playlist 57	58
58	Playlist 58	731
59	Playlist 59	187
60	Playlist 60	226
61	Playlist 61	99
62	Playlist 62	147
63	Playlist 63	645
64	Playlist 64	595
65	Playlist 65	601
66	Playlist 66	479
67	Playlist 67	637
68	Playlist 68	450
69	Playlist 69	451
70	Playlist 70	262
71	Playlist 71	586
72	Playlist 72	728
73	Playlist 73	865
74	Playlist 74	870
75	Playlist 75	842
76	Playlist 76	682
77	Playlist 77	691
78	Playlist 78	847
79	Playlist 79	603
80	Playlist 80	820
81	Playlist 81	747
82	Playlist 82	435
83	Playlist 83	207
84	Playlist 84	239
85	Playlist 85	74
86	Playlist 86	907
87	Playlist 87	286
88	Playlist 88	346
89	Playlist 89	727
90	Playlist 90	980
91	Playlist 91	869
92	Playlist 92	370
93	Playlist 93	132
94	Playlist 94	859
95	Playlist 95	688
96	Playlist 96	293
97	Playlist 97	739
98	Playlist 98	806
99	Playlist 99	804
100	Playlist 100	261
101	Playlist 101	807
102	Playlist 102	9
103	Playlist 103	383
104	Playlist 104	840
105	Playlist 105	38
106	Playlist 106	474
107	Playlist 107	602
108	Playlist 108	344
109	Playlist 109	307
110	Playlist 110	392
111	Playlist 111	54
112	Playlist 112	491
113	Playlist 113	550
114	Playlist 114	18
115	Playlist 115	644
116	Playlist 116	840
117	Playlist 117	415
118	Playlist 118	558
119	Playlist 119	186
120	Playlist 120	566
121	Playlist 121	961
122	Playlist 122	319
123	Playlist 123	976
124	Playlist 124	218
125	Playlist 125	919
126	Playlist 126	619
127	Playlist 127	192
128	Playlist 128	839
129	Playlist 129	996
130	Playlist 130	370
131	Playlist 131	419
132	Playlist 132	2
133	Playlist 133	658
134	Playlist 134	166
135	Playlist 135	932
136	Playlist 136	709
137	Playlist 137	183
138	Playlist 138	870
139	Playlist 139	900
140	Playlist 140	429
141	Playlist 141	578
142	Playlist 142	664
143	Playlist 143	132
144	Playlist 144	760
145	Playlist 145	103
146	Playlist 146	757
147	Playlist 147	692
148	Playlist 148	617
149	Playlist 149	649
150	Playlist 150	591
151	Playlist 151	692
152	Playlist 152	331
153	Playlist 153	92
154	Playlist 154	392
155	Playlist 155	180
156	Playlist 156	823
157	Playlist 157	33
158	Playlist 158	33
159	Playlist 159	342
160	Playlist 160	241
161	Playlist 161	586
162	Playlist 162	334
163	Playlist 163	715
164	Playlist 164	376
165	Playlist 165	678
166	Playlist 166	977
167	Playlist 167	44
168	Playlist 168	201
169	Playlist 169	692
170	Playlist 170	22
171	Playlist 171	459
172	Playlist 172	729
173	Playlist 173	93
174	Playlist 174	82
175	Playlist 175	220
176	Playlist 176	956
177	Playlist 177	407
178	Playlist 178	403
179	Playlist 179	454
180	Playlist 180	950
181	Playlist 181	675
182	Playlist 182	621
183	Playlist 183	134
184	Playlist 184	656
185	Playlist 185	775
186	Playlist 186	236
187	Playlist 187	383
188	Playlist 188	884
189	Playlist 189	698
190	Playlist 190	490
191	Playlist 191	743
192	Playlist 192	172
193	Playlist 193	116
194	Playlist 194	951
195	Playlist 195	160
196	Playlist 196	199
197	Playlist 197	93
198	Playlist 198	484
199	Playlist 199	852
200	Playlist 200	42
201	Playlist 201	595
202	Playlist 202	704
203	Playlist 203	592
204	Playlist 204	148
205	Playlist 205	534
206	Playlist 206	448
207	Playlist 207	996
208	Playlist 208	741
209	Playlist 209	264
210	Playlist 210	716
211	Playlist 211	742
212	Playlist 212	732
213	Playlist 213	725
214	Playlist 214	494
215	Playlist 215	686
216	Playlist 216	243
217	Playlist 217	679
218	Playlist 218	369
219	Playlist 219	698
220	Playlist 220	814
221	Playlist 221	579
222	Playlist 222	607
223	Playlist 223	18
224	Playlist 224	866
225	Playlist 225	293
226	Playlist 226	28
227	Playlist 227	966
228	Playlist 228	674
229	Playlist 229	498
230	Playlist 230	961
231	Playlist 231	982
232	Playlist 232	404
233	Playlist 233	907
234	Playlist 234	837
235	Playlist 235	443
236	Playlist 236	892
237	Playlist 237	16
238	Playlist 238	822
239	Playlist 239	770
240	Playlist 240	856
241	Playlist 241	587
242	Playlist 242	452
243	Playlist 243	20
244	Playlist 244	852
245	Playlist 245	834
246	Playlist 246	717
247	Playlist 247	278
248	Playlist 248	394
249	Playlist 249	56
250	Playlist 250	203
251	Playlist 251	351
252	Playlist 252	864
253	Playlist 253	548
254	Playlist 254	370
255	Playlist 255	314
256	Playlist 256	1000
257	Playlist 257	57
258	Playlist 258	40
259	Playlist 259	68
260	Playlist 260	755
261	Playlist 261	755
262	Playlist 262	204
263	Playlist 263	510
264	Playlist 264	651
265	Playlist 265	300
266	Playlist 266	333
267	Playlist 267	211
268	Playlist 268	100
269	Playlist 269	473
270	Playlist 270	768
271	Playlist 271	461
272	Playlist 272	409
273	Playlist 273	256
274	Playlist 274	585
275	Playlist 275	56
276	Playlist 276	807
277	Playlist 277	705
278	Playlist 278	564
279	Playlist 279	842
280	Playlist 280	687
281	Playlist 281	74
282	Playlist 282	245
283	Playlist 283	487
284	Playlist 284	593
285	Playlist 285	933
286	Playlist 286	139
287	Playlist 287	632
288	Playlist 288	514
289	Playlist 289	705
290	Playlist 290	39
291	Playlist 291	500
292	Playlist 292	665
293	Playlist 293	991
294	Playlist 294	740
295	Playlist 295	664
296	Playlist 296	894
297	Playlist 297	977
298	Playlist 298	175
299	Playlist 299	865
300	Playlist 300	57
301	Playlist 301	592
302	Playlist 302	582
303	Playlist 303	489
304	Playlist 304	594
305	Playlist 305	723
306	Playlist 306	655
307	Playlist 307	223
308	Playlist 308	325
309	Playlist 309	420
310	Playlist 310	994
311	Playlist 311	53
312	Playlist 312	647
313	Playlist 313	416
314	Playlist 314	596
315	Playlist 315	820
316	Playlist 316	548
317	Playlist 317	378
318	Playlist 318	223
319	Playlist 319	963
320	Playlist 320	748
321	Playlist 321	52
322	Playlist 322	371
323	Playlist 323	443
324	Playlist 324	383
325	Playlist 325	552
326	Playlist 326	488
327	Playlist 327	744
328	Playlist 328	564
329	Playlist 329	296
330	Playlist 330	756
331	Playlist 331	105
332	Playlist 332	823
333	Playlist 333	594
334	Playlist 334	247
335	Playlist 335	707
336	Playlist 336	946
337	Playlist 337	259
338	Playlist 338	136
339	Playlist 339	69
340	Playlist 340	478
341	Playlist 341	985
342	Playlist 342	559
343	Playlist 343	852
344	Playlist 344	638
345	Playlist 345	911
346	Playlist 346	771
347	Playlist 347	709
348	Playlist 348	994
349	Playlist 349	355
350	Playlist 350	569
351	Playlist 351	594
352	Playlist 352	24
353	Playlist 353	584
354	Playlist 354	242
355	Playlist 355	102
356	Playlist 356	88
357	Playlist 357	220
358	Playlist 358	33
359	Playlist 359	524
360	Playlist 360	260
361	Playlist 361	955
362	Playlist 362	451
363	Playlist 363	762
364	Playlist 364	315
365	Playlist 365	79
366	Playlist 366	219
367	Playlist 367	96
368	Playlist 368	394
369	Playlist 369	752
370	Playlist 370	975
371	Playlist 371	657
372	Playlist 372	117
373	Playlist 373	798
374	Playlist 374	275
375	Playlist 375	984
376	Playlist 376	287
377	Playlist 377	794
378	Playlist 378	301
379	Playlist 379	797
380	Playlist 380	776
381	Playlist 381	841
382	Playlist 382	164
383	Playlist 383	964
384	Playlist 384	569
385	Playlist 385	493
386	Playlist 386	679
387	Playlist 387	507
388	Playlist 388	810
389	Playlist 389	188
390	Playlist 390	880
391	Playlist 391	57
392	Playlist 392	426
393	Playlist 393	249
394	Playlist 394	600
395	Playlist 395	921
396	Playlist 396	900
397	Playlist 397	771
398	Playlist 398	20
399	Playlist 399	904
400	Playlist 400	992
401	Playlist 401	840
402	Playlist 402	965
403	Playlist 403	868
404	Playlist 404	909
405	Playlist 405	172
406	Playlist 406	706
407	Playlist 407	983
408	Playlist 408	404
409	Playlist 409	540
410	Playlist 410	102
411	Playlist 411	275
412	Playlist 412	452
413	Playlist 413	425
414	Playlist 414	455
415	Playlist 415	342
416	Playlist 416	873
417	Playlist 417	729
418	Playlist 418	198
419	Playlist 419	932
420	Playlist 420	711
421	Playlist 421	712
422	Playlist 422	263
423	Playlist 423	360
424	Playlist 424	516
425	Playlist 425	294
426	Playlist 426	659
427	Playlist 427	671
428	Playlist 428	143
429	Playlist 429	415
430	Playlist 430	782
431	Playlist 431	300
432	Playlist 432	608
433	Playlist 433	465
434	Playlist 434	519
435	Playlist 435	40
436	Playlist 436	222
437	Playlist 437	897
438	Playlist 438	829
439	Playlist 439	77
440	Playlist 440	707
441	Playlist 441	814
442	Playlist 442	739
443	Playlist 443	369
444	Playlist 444	32
445	Playlist 445	967
446	Playlist 446	878
447	Playlist 447	448
448	Playlist 448	192
449	Playlist 449	82
450	Playlist 450	200
451	Playlist 451	121
452	Playlist 452	667
453	Playlist 453	95
454	Playlist 454	724
455	Playlist 455	602
456	Playlist 456	161
457	Playlist 457	122
458	Playlist 458	367
459	Playlist 459	188
460	Playlist 460	577
461	Playlist 461	18
462	Playlist 462	796
463	Playlist 463	950
464	Playlist 464	441
465	Playlist 465	670
466	Playlist 466	877
467	Playlist 467	731
468	Playlist 468	661
469	Playlist 469	775
470	Playlist 470	23
471	Playlist 471	406
472	Playlist 472	172
473	Playlist 473	808
474	Playlist 474	339
475	Playlist 475	941
476	Playlist 476	967
477	Playlist 477	118
478	Playlist 478	596
479	Playlist 479	330
480	Playlist 480	623
481	Playlist 481	648
482	Playlist 482	18
483	Playlist 483	827
484	Playlist 484	953
485	Playlist 485	742
486	Playlist 486	289
487	Playlist 487	708
488	Playlist 488	821
489	Playlist 489	529
490	Playlist 490	697
491	Playlist 491	175
492	Playlist 492	156
493	Playlist 493	464
494	Playlist 494	940
495	Playlist 495	73
496	Playlist 496	172
497	Playlist 497	627
498	Playlist 498	911
499	Playlist 499	204
500	Playlist 500	462
501	Playlist 501	445
502	Playlist 502	794
503	Playlist 503	633
504	Playlist 504	106
505	Playlist 505	883
506	Playlist 506	140
507	Playlist 507	772
508	Playlist 508	809
509	Playlist 509	270
510	Playlist 510	939
511	Playlist 511	842
512	Playlist 512	813
513	Playlist 513	906
514	Playlist 514	170
515	Playlist 515	884
516	Playlist 516	803
517	Playlist 517	724
518	Playlist 518	880
519	Playlist 519	758
520	Playlist 520	952
521	Playlist 521	323
522	Playlist 522	77
523	Playlist 523	230
524	Playlist 524	982
525	Playlist 525	923
526	Playlist 526	249
527	Playlist 527	164
528	Playlist 528	722
529	Playlist 529	431
530	Playlist 530	341
531	Playlist 531	935
532	Playlist 532	421
533	Playlist 533	995
534	Playlist 534	594
535	Playlist 535	226
536	Playlist 536	193
537	Playlist 537	335
538	Playlist 538	968
539	Playlist 539	312
540	Playlist 540	930
541	Playlist 541	65
542	Playlist 542	702
543	Playlist 543	641
544	Playlist 544	328
545	Playlist 545	854
546	Playlist 546	182
547	Playlist 547	531
548	Playlist 548	847
549	Playlist 549	824
550	Playlist 550	684
551	Playlist 551	458
552	Playlist 552	360
553	Playlist 553	404
554	Playlist 554	57
555	Playlist 555	185
556	Playlist 556	119
557	Playlist 557	53
558	Playlist 558	401
559	Playlist 559	897
560	Playlist 560	559
561	Playlist 561	211
562	Playlist 562	724
563	Playlist 563	547
564	Playlist 564	294
565	Playlist 565	735
566	Playlist 566	904
567	Playlist 567	184
568	Playlist 568	489
569	Playlist 569	605
570	Playlist 570	23
571	Playlist 571	649
572	Playlist 572	79
573	Playlist 573	232
574	Playlist 574	865
575	Playlist 575	81
576	Playlist 576	540
577	Playlist 577	716
578	Playlist 578	216
579	Playlist 579	990
580	Playlist 580	158
581	Playlist 581	155
582	Playlist 582	768
583	Playlist 583	576
584	Playlist 584	28
585	Playlist 585	427
586	Playlist 586	519
587	Playlist 587	871
588	Playlist 588	90
589	Playlist 589	202
590	Playlist 590	705
591	Playlist 591	857
592	Playlist 592	456
593	Playlist 593	739
594	Playlist 594	669
595	Playlist 595	577
596	Playlist 596	929
597	Playlist 597	336
598	Playlist 598	43
599	Playlist 599	517
600	Playlist 600	735
601	Playlist 601	142
602	Playlist 602	2
603	Playlist 603	706
604	Playlist 604	541
605	Playlist 605	280
606	Playlist 606	748
607	Playlist 607	459
608	Playlist 608	982
609	Playlist 609	564
610	Playlist 610	633
611	Playlist 611	449
612	Playlist 612	477
613	Playlist 613	677
614	Playlist 614	697
615	Playlist 615	595
616	Playlist 616	297
617	Playlist 617	107
618	Playlist 618	175
619	Playlist 619	864
620	Playlist 620	292
621	Playlist 621	453
622	Playlist 622	478
623	Playlist 623	955
624	Playlist 624	494
625	Playlist 625	970
626	Playlist 626	489
627	Playlist 627	825
628	Playlist 628	250
629	Playlist 629	36
630	Playlist 630	834
631	Playlist 631	171
632	Playlist 632	391
633	Playlist 633	180
634	Playlist 634	873
635	Playlist 635	656
636	Playlist 636	513
637	Playlist 637	634
638	Playlist 638	49
639	Playlist 639	479
640	Playlist 640	612
641	Playlist 641	491
642	Playlist 642	825
643	Playlist 643	67
644	Playlist 644	957
645	Playlist 645	189
646	Playlist 646	559
647	Playlist 647	458
648	Playlist 648	292
649	Playlist 649	421
650	Playlist 650	320
651	Playlist 651	514
652	Playlist 652	435
653	Playlist 653	700
654	Playlist 654	692
655	Playlist 655	795
656	Playlist 656	298
657	Playlist 657	845
658	Playlist 658	78
659	Playlist 659	162
660	Playlist 660	975
661	Playlist 661	883
662	Playlist 662	303
663	Playlist 663	343
664	Playlist 664	695
665	Playlist 665	930
666	Playlist 666	445
667	Playlist 667	892
668	Playlist 668	919
669	Playlist 669	15
670	Playlist 670	576
671	Playlist 671	895
672	Playlist 672	462
673	Playlist 673	196
674	Playlist 674	376
675	Playlist 675	820
676	Playlist 676	210
677	Playlist 677	15
678	Playlist 678	819
679	Playlist 679	942
680	Playlist 680	584
681	Playlist 681	613
682	Playlist 682	482
683	Playlist 683	826
684	Playlist 684	33
685	Playlist 685	737
686	Playlist 686	756
687	Playlist 687	673
688	Playlist 688	733
689	Playlist 689	693
690	Playlist 690	280
691	Playlist 691	373
692	Playlist 692	8
693	Playlist 693	161
694	Playlist 694	338
695	Playlist 695	272
696	Playlist 696	227
697	Playlist 697	149
698	Playlist 698	1000
699	Playlist 699	233
700	Playlist 700	654
701	Playlist 701	357
702	Playlist 702	443
703	Playlist 703	782
704	Playlist 704	293
705	Playlist 705	273
706	Playlist 706	752
707	Playlist 707	391
708	Playlist 708	696
709	Playlist 709	707
710	Playlist 710	870
711	Playlist 711	938
712	Playlist 712	880
713	Playlist 713	571
714	Playlist 714	147
715	Playlist 715	96
716	Playlist 716	512
717	Playlist 717	917
718	Playlist 718	914
719	Playlist 719	868
720	Playlist 720	666
721	Playlist 721	224
722	Playlist 722	347
723	Playlist 723	548
724	Playlist 724	533
725	Playlist 725	462
726	Playlist 726	787
727	Playlist 727	677
728	Playlist 728	401
729	Playlist 729	666
730	Playlist 730	549
731	Playlist 731	837
732	Playlist 732	665
733	Playlist 733	691
734	Playlist 734	925
735	Playlist 735	237
736	Playlist 736	590
737	Playlist 737	416
738	Playlist 738	251
739	Playlist 739	532
740	Playlist 740	106
741	Playlist 741	613
742	Playlist 742	968
743	Playlist 743	877
744	Playlist 744	341
745	Playlist 745	966
746	Playlist 746	586
747	Playlist 747	300
748	Playlist 748	801
749	Playlist 749	638
750	Playlist 750	647
751	Playlist 751	156
752	Playlist 752	147
753	Playlist 753	131
754	Playlist 754	858
755	Playlist 755	824
756	Playlist 756	340
757	Playlist 757	551
758	Playlist 758	651
759	Playlist 759	696
760	Playlist 760	676
761	Playlist 761	200
762	Playlist 762	847
763	Playlist 763	142
764	Playlist 764	90
765	Playlist 765	690
766	Playlist 766	777
767	Playlist 767	650
768	Playlist 768	874
769	Playlist 769	446
770	Playlist 770	273
771	Playlist 771	600
772	Playlist 772	336
773	Playlist 773	834
774	Playlist 774	557
775	Playlist 775	283
776	Playlist 776	349
777	Playlist 777	838
778	Playlist 778	329
779	Playlist 779	933
780	Playlist 780	478
781	Playlist 781	253
782	Playlist 782	953
783	Playlist 783	227
784	Playlist 784	68
785	Playlist 785	58
786	Playlist 786	935
787	Playlist 787	604
788	Playlist 788	960
789	Playlist 789	55
790	Playlist 790	743
791	Playlist 791	270
792	Playlist 792	250
793	Playlist 793	853
794	Playlist 794	334
795	Playlist 795	690
796	Playlist 796	220
797	Playlist 797	848
798	Playlist 798	943
799	Playlist 799	171
800	Playlist 800	145
801	Playlist 801	234
802	Playlist 802	99
803	Playlist 803	611
804	Playlist 804	221
805	Playlist 805	866
806	Playlist 806	872
807	Playlist 807	640
808	Playlist 808	976
809	Playlist 809	595
810	Playlist 810	393
811	Playlist 811	876
812	Playlist 812	937
813	Playlist 813	744
814	Playlist 814	378
815	Playlist 815	930
816	Playlist 816	241
817	Playlist 817	502
818	Playlist 818	792
819	Playlist 819	298
820	Playlist 820	50
821	Playlist 821	185
822	Playlist 822	940
823	Playlist 823	872
824	Playlist 824	788
825	Playlist 825	482
826	Playlist 826	401
827	Playlist 827	164
828	Playlist 828	534
829	Playlist 829	718
830	Playlist 830	303
831	Playlist 831	403
832	Playlist 832	980
833	Playlist 833	994
834	Playlist 834	140
835	Playlist 835	365
836	Playlist 836	787
837	Playlist 837	624
838	Playlist 838	323
839	Playlist 839	781
840	Playlist 840	887
841	Playlist 841	147
842	Playlist 842	209
843	Playlist 843	758
844	Playlist 844	654
845	Playlist 845	94
846	Playlist 846	228
847	Playlist 847	678
848	Playlist 848	508
849	Playlist 849	488
850	Playlist 850	426
851	Playlist 851	950
852	Playlist 852	212
853	Playlist 853	108
854	Playlist 854	104
855	Playlist 855	815
856	Playlist 856	641
857	Playlist 857	937
858	Playlist 858	650
859	Playlist 859	874
860	Playlist 860	634
861	Playlist 861	578
862	Playlist 862	226
863	Playlist 863	151
864	Playlist 864	996
865	Playlist 865	233
866	Playlist 866	893
867	Playlist 867	754
868	Playlist 868	849
869	Playlist 869	711
870	Playlist 870	597
871	Playlist 871	178
872	Playlist 872	709
873	Playlist 873	245
874	Playlist 874	205
875	Playlist 875	363
876	Playlist 876	100
877	Playlist 877	965
878	Playlist 878	527
879	Playlist 879	416
880	Playlist 880	294
881	Playlist 881	794
882	Playlist 882	292
883	Playlist 883	132
884	Playlist 884	541
885	Playlist 885	198
886	Playlist 886	386
887	Playlist 887	55
888	Playlist 888	513
889	Playlist 889	257
890	Playlist 890	32
891	Playlist 891	167
892	Playlist 892	532
893	Playlist 893	125
894	Playlist 894	768
895	Playlist 895	72
896	Playlist 896	203
897	Playlist 897	798
898	Playlist 898	606
899	Playlist 899	26
900	Playlist 900	134
901	Playlist 901	630
902	Playlist 902	230
903	Playlist 903	113
904	Playlist 904	290
905	Playlist 905	836
906	Playlist 906	633
907	Playlist 907	976
908	Playlist 908	330
909	Playlist 909	894
910	Playlist 910	923
911	Playlist 911	441
912	Playlist 912	656
913	Playlist 913	12
914	Playlist 914	668
915	Playlist 915	960
916	Playlist 916	577
917	Playlist 917	391
918	Playlist 918	121
919	Playlist 919	612
920	Playlist 920	431
921	Playlist 921	147
922	Playlist 922	658
923	Playlist 923	313
924	Playlist 924	21
925	Playlist 925	627
926	Playlist 926	825
927	Playlist 927	385
928	Playlist 928	509
929	Playlist 929	243
930	Playlist 930	956
931	Playlist 931	340
932	Playlist 932	740
933	Playlist 933	294
934	Playlist 934	627
935	Playlist 935	61
936	Playlist 936	926
937	Playlist 937	502
938	Playlist 938	631
939	Playlist 939	81
940	Playlist 940	886
941	Playlist 941	812
942	Playlist 942	477
943	Playlist 943	671
944	Playlist 944	95
945	Playlist 945	194
946	Playlist 946	324
947	Playlist 947	614
948	Playlist 948	539
949	Playlist 949	900
950	Playlist 950	384
951	Playlist 951	334
952	Playlist 952	65
953	Playlist 953	772
954	Playlist 954	236
955	Playlist 955	259
956	Playlist 956	818
957	Playlist 957	779
958	Playlist 958	381
959	Playlist 959	734
960	Playlist 960	717
961	Playlist 961	293
962	Playlist 962	949
963	Playlist 963	231
964	Playlist 964	115
965	Playlist 965	232
966	Playlist 966	55
967	Playlist 967	401
968	Playlist 968	481
969	Playlist 969	878
970	Playlist 970	213
971	Playlist 971	223
972	Playlist 972	490
973	Playlist 973	733
974	Playlist 974	26
975	Playlist 975	575
976	Playlist 976	354
977	Playlist 977	108
978	Playlist 978	361
979	Playlist 979	318
980	Playlist 980	94
981	Playlist 981	71
982	Playlist 982	896
983	Playlist 983	679
984	Playlist 984	78
985	Playlist 985	144
986	Playlist 986	479
987	Playlist 987	215
988	Playlist 988	75
989	Playlist 989	295
990	Playlist 990	674
991	Playlist 991	363
992	Playlist 992	908
993	Playlist 993	410
994	Playlist 994	614
995	Playlist 995	424
996	Playlist 996	552
997	Playlist 997	912
998	Playlist 998	203
999	Playlist 999	707
1000	Playlist 1000	29
\.


--
-- TOC entry 3638 (class 0 OID 27105)
-- Dependencies: 222
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (song_id, artist_id, yearofrelease) FROM stdin;
1	991	1920
2	202	1959
3	893	1969
4	895	1973
5	731	2020
6	631	1955
7	388	1916
8	978	1930
9	269	1940
10	889	1979
11	945	1958
12	114	1918
13	823	1990
14	462	1934
15	781	1974
16	55	2018
17	337	1980
18	487	1984
19	313	2017
20	76	2010
21	536	1921
22	416	2000
23	156	2012
24	909	1923
25	511	2014
26	14	1907
27	117	1997
28	195	1903
29	44	1961
30	181	1909
31	631	2012
32	537	1911
33	298	1900
34	753	1951
35	216	2006
36	924	1966
37	17	1943
38	934	2006
39	916	1909
40	136	1941
41	408	1959
42	75	2001
43	390	1903
44	323	1998
45	190	1917
46	675	1977
47	399	1959
48	259	1934
49	750	1921
50	71	1900
51	371	1981
52	694	1914
53	5	1958
54	705	2006
55	143	1929
56	319	1981
57	963	1950
58	299	2008
59	713	1988
60	916	1916
61	50	1946
62	197	1925
63	710	1987
64	273	1968
65	408	1940
66	151	1906
67	965	2000
68	706	1950
69	4	2009
70	199	1961
71	213	1911
72	234	2000
73	379	1926
74	615	1967
75	55	1905
76	406	1973
77	757	1965
78	843	1925
79	292	2017
80	534	2009
81	585	2008
82	290	1947
83	212	2020
84	13	1931
85	813	1919
86	384	1935
87	794	1995
88	337	1952
89	991	1930
90	270	1925
91	55	1983
92	355	2011
93	123	2016
94	878	1950
95	829	2012
96	706	1940
97	658	1962
98	508	2007
99	25	1932
100	780	1969
101	108	1941
102	852	1932
103	413	1902
104	65	1973
105	675	1949
106	886	1908
107	792	2001
108	439	1963
109	252	2015
110	396	1992
111	378	1967
112	781	1983
113	717	1991
114	349	1945
115	728	2017
116	860	1947
117	880	1908
118	674	1959
119	108	1954
120	279	1982
121	991	1950
122	376	1999
123	21	1917
124	377	1997
125	275	1964
126	552	1978
127	944	1906
128	957	1967
129	775	1928
130	331	1989
131	365	1933
132	606	1944
133	585	1923
134	453	1913
135	593	1956
136	348	1991
137	460	1982
138	414	1919
139	971	1916
140	560	1998
141	532	1986
142	821	1973
143	933	1942
144	205	1983
145	365	1941
146	466	1936
147	220	1922
148	307	1990
149	11	1932
150	814	1986
151	999	1966
152	912	1953
153	695	2011
154	631	1924
155	465	1994
156	305	1948
157	519	1938
158	238	1924
159	846	1952
160	24	1983
161	428	1981
162	244	2008
163	702	1993
164	629	1998
165	718	2006
166	357	1922
167	56	2005
168	116	2009
169	420	1927
170	727	1909
171	308	2018
172	734	1967
173	184	2019
174	103	1941
175	77	1971
176	208	1988
177	912	1984
178	685	1970
179	585	1946
180	558	1912
181	468	1934
182	955	1997
183	895	1967
184	827	1960
185	567	1991
186	153	1922
187	827	1991
188	76	1919
189	147	1989
190	182	1900
191	169	1923
192	951	1934
193	49	1902
194	664	1914
195	520	1999
196	844	2009
197	47	1989
198	326	1964
199	998	1928
200	523	1972
201	587	2001
202	897	1967
203	384	1938
204	856	1919
205	232	1954
206	555	2019
207	50	1918
208	647	1944
209	80	1932
210	367	1949
211	993	2000
212	954	1929
213	726	1958
214	726	2000
215	541	1946
216	104	1958
217	255	2018
218	972	1988
219	710	1959
220	365	1978
221	118	1924
222	731	1917
223	207	1978
224	127	1914
225	479	1965
226	328	1959
227	711	1953
228	420	1964
229	372	1972
230	292	1952
231	377	1942
232	89	1947
233	576	1986
234	7	1916
235	933	1900
236	887	1948
237	655	1962
238	936	2018
239	359	1924
240	105	1919
241	703	1936
242	547	1976
243	165	1919
244	821	1956
245	692	1990
246	642	1904
247	299	2005
248	94	1954
249	297	1995
250	328	1941
251	623	1988
252	378	1970
253	177	1907
254	560	1936
255	21	2001
256	219	1918
257	989	1971
258	786	1913
259	354	1917
260	323	2003
261	875	1944
262	668	1978
263	64	1993
264	675	1948
265	488	1939
266	216	2005
267	566	1941
268	19	1931
269	878	2015
270	598	1991
271	207	1960
272	795	1999
273	314	1952
274	256	1976
275	923	1928
276	497	2005
277	309	2009
278	307	2004
279	701	2001
280	538	1902
281	908	1949
282	886	1958
283	257	2012
284	856	1966
285	779	1997
286	136	1985
287	415	1944
288	530	2001
289	814	1920
290	897	1912
291	47	1972
292	888	1909
293	742	1917
294	110	1948
295	14	2016
296	988	1910
297	230	1993
298	1000	1936
299	271	1959
300	145	1998
301	129	1945
302	213	1937
303	498	2001
304	689	1900
305	591	1995
306	562	2010
307	931	1946
308	554	1982
309	619	1943
310	808	1933
311	812	1922
312	530	2006
313	279	2011
314	745	1904
315	84	2012
316	936	1972
317	502	1902
318	318	1995
319	637	1930
320	229	1983
321	125	1929
322	781	1926
323	384	1977
324	871	1914
325	325	2008
326	182	1961
327	30	1947
328	233	1952
329	337	1977
330	689	1952
331	834	1960
332	936	1992
333	398	1930
334	154	1926
335	584	1949
336	785	1951
337	449	1967
338	154	1932
339	334	1992
340	296	1928
341	955	1941
342	583	2014
343	41	1952
344	657	1937
345	19	1957
346	682	2000
347	640	1948
348	762	2006
349	815	2016
350	839	1963
351	227	1906
352	653	1933
353	271	1980
354	387	2013
355	217	1982
356	22	1914
357	55	1957
358	652	1956
359	494	1950
360	441	1988
361	145	1952
362	502	2003
363	726	1977
364	776	1985
365	77	1996
366	904	1983
367	876	1977
368	325	2014
369	870	1956
370	953	1938
371	527	2011
372	319	1991
373	636	1940
374	774	1978
375	476	1942
376	132	1940
377	560	1962
378	454	1909
379	596	1970
380	35	1914
381	49	1996
382	519	1914
383	50	1956
384	195	1913
385	472	1928
386	830	1939
387	422	1920
388	900	1984
389	789	2003
390	260	1909
391	5	2015
392	120	2004
393	7	2009
394	262	2014
395	275	1995
396	971	1914
397	521	1930
398	509	1918
399	751	2010
400	220	1911
401	78	1953
402	442	1987
403	417	1983
404	721	1913
405	314	1931
406	830	1953
407	462	1964
408	58	1990
409	260	1968
410	38	2007
411	666	1994
412	42	1926
413	709	1975
414	290	1914
415	542	1952
416	648	1946
417	673	1950
418	222	1910
419	917	1942
420	941	1950
421	81	1908
422	299	1900
423	576	1914
424	400	1965
425	422	1962
426	192	2014
427	911	1903
428	945	2021
429	4	1924
430	259	1995
431	790	1952
432	95	1997
433	522	1913
434	247	1928
435	679	2013
436	846	1975
437	621	1958
438	77	2010
439	801	1932
440	426	1966
441	189	1944
442	934	1914
443	739	1924
444	612	2001
445	68	1992
446	768	1937
447	335	1949
448	71	1964
449	25	1904
450	74	1918
451	66	1932
452	197	1966
453	945	2004
454	767	1930
455	72	2005
456	550	1981
457	534	1988
458	120	1923
459	433	1915
460	860	2008
461	231	1939
462	854	2011
463	345	1922
464	945	1918
465	114	2018
466	423	1916
467	488	1909
468	173	1953
469	261	1908
470	363	1945
471	19	1976
472	637	1961
473	694	1949
474	315	1934
475	666	2013
476	89	1992
477	59	2014
478	198	1925
479	581	1945
480	174	1916
481	782	1952
482	165	1941
483	94	1944
484	990	2006
485	79	1930
486	527	1973
487	488	1905
488	293	1964
489	986	1981
490	961	1977
491	925	1981
492	221	1964
493	729	1941
494	470	2016
495	952	1972
496	286	1963
497	869	1974
498	616	2004
499	221	1985
500	405	1901
501	30	1949
502	808	1997
503	513	1987
504	735	1985
505	757	1951
506	155	1990
507	441	1963
508	375	1914
509	911	1969
510	570	1986
511	255	1925
512	542	1971
513	845	1936
514	484	2011
515	181	1963
516	1	1979
517	493	1973
518	213	1914
519	742	1926
520	324	1952
521	615	1912
522	338	1993
523	252	1993
524	935	1941
525	355	1992
526	859	1979
527	113	2011
528	733	2001
529	906	1989
530	289	1967
531	553	2005
532	477	1936
533	151	1999
534	324	2017
535	613	1985
536	435	2014
537	264	2004
538	962	1917
539	927	1924
540	753	2001
541	73	1906
542	721	1966
543	561	1905
544	617	1983
545	879	1917
546	537	1911
547	605	1928
548	808	1904
549	980	1905
550	17	1935
551	797	1913
552	927	1931
553	601	1912
554	848	2015
555	857	1995
556	490	1966
557	650	1974
558	857	2001
559	214	2004
560	926	1982
561	519	2015
562	466	1930
563	103	1939
564	470	1971
565	632	2012
566	910	1985
567	867	2017
568	50	1949
569	925	1994
570	69	2000
571	741	1987
572	615	2002
573	975	1998
574	492	1918
575	229	1984
576	155	1941
577	18	1952
578	321	1937
579	390	1938
580	296	1992
581	587	1970
582	494	1948
583	990	1954
584	278	1911
585	712	1979
586	672	1935
587	302	1970
588	802	1904
589	185	1926
590	820	1962
591	668	1965
592	725	1932
593	828	1967
594	728	2010
595	28	1943
596	198	1965
597	53	1916
598	214	1989
599	884	1988
600	782	1958
601	559	1963
602	141	1946
603	306	1920
604	320	1907
605	247	1989
606	999	2002
607	547	2015
608	459	1912
609	533	1993
610	509	1985
611	516	1980
612	236	1958
613	70	1913
614	618	1917
615	561	2019
616	640	1944
617	664	1926
618	984	1904
619	249	1953
620	934	1943
621	269	1941
622	881	1979
623	818	2006
624	89	2006
625	572	1946
626	71	1996
627	668	1938
628	493	1985
629	837	2003
630	944	1919
631	795	1909
632	10	2018
633	26	1943
634	920	1903
635	815	1955
636	661	1910
637	341	1957
638	359	2007
639	776	1939
640	622	2014
641	405	1969
642	203	1918
643	655	1906
644	704	1979
645	283	1977
646	622	2010
647	487	1984
648	119	1983
649	714	1907
650	79	1994
651	766	2007
652	896	1983
653	638	1972
654	274	2004
655	380	1978
656	174	1952
657	769	1904
658	558	1977
659	652	1969
660	485	1943
661	697	2018
662	793	1937
663	458	2011
664	149	1950
665	393	1911
666	894	1920
667	844	1988
668	455	1901
669	926	1951
670	752	1957
671	296	2020
672	187	1934
673	981	1904
674	824	1939
675	59	1942
676	839	2002
677	497	1975
678	964	1945
679	815	2001
680	992	1973
681	699	1929
682	961	1958
683	430	1905
684	979	1940
685	915	1979
686	691	1950
687	991	1999
688	729	1998
689	12	1940
690	541	1940
691	612	1952
692	241	1987
693	276	1945
694	26	1975
695	997	1960
696	66	2021
697	467	1926
698	684	1909
699	895	2003
700	613	1964
701	978	1924
702	913	1976
703	606	1963
704	644	1909
705	379	2014
706	774	1992
707	580	1978
708	931	1950
709	584	1954
710	622	1969
711	682	2006
712	130	1930
713	237	1931
714	852	1985
715	713	1984
716	941	1911
717	50	1973
718	622	1932
719	948	1987
720	301	2003
721	51	2011
722	634	1998
723	369	1975
724	707	1964
725	694	1999
726	69	1981
727	560	1966
728	402	1926
729	667	1921
730	287	1934
731	66	1921
732	110	1946
733	37	2020
734	139	1967
735	805	1903
736	876	2012
737	46	1988
738	735	1918
739	311	1985
740	360	1979
741	930	1941
742	434	1932
743	345	1976
744	648	1941
745	910	1955
746	931	2019
747	126	1938
748	274	1920
749	114	2007
750	622	1951
751	30	1908
752	254	1905
753	367	1940
754	831	1935
755	219	1924
756	848	1971
757	980	1987
758	599	2021
759	1000	1994
760	941	2003
761	681	1989
762	747	1914
763	117	1981
764	174	1900
765	521	2002
766	162	1983
767	776	1972
768	453	1970
769	84	1985
770	818	1972
771	198	1998
772	381	1999
773	216	1991
774	173	1916
775	483	1933
776	587	1908
777	676	2009
778	842	1920
779	389	1973
780	301	1922
781	812	1912
782	527	1980
783	11	1962
784	589	1951
785	191	1994
786	851	1972
787	778	1978
788	540	1931
789	559	1951
790	522	1963
791	891	1961
792	228	2005
793	434	1945
794	979	1922
795	852	2019
796	650	1951
797	688	1960
798	617	1902
799	501	1983
800	884	1945
801	270	1958
802	166	1957
803	227	1943
804	813	2005
805	95	2001
806	713	1935
807	111	1932
808	953	2017
809	341	2017
810	760	1989
811	545	1924
812	703	1960
813	719	1973
814	294	1979
815	724	1955
816	847	1905
817	606	2016
818	536	1968
819	988	1912
820	941	2006
821	322	1989
822	655	1952
823	338	1974
824	291	1997
825	300	1926
826	36	1977
827	323	1901
828	936	1927
829	102	1996
830	169	2004
831	363	2002
832	933	1993
833	295	1961
834	499	1934
835	506	1956
836	464	1962
837	286	1925
838	980	1937
839	406	2002
840	716	1976
841	518	1964
842	311	2005
843	226	1961
844	160	1919
845	167	1942
846	946	1902
847	433	1983
848	403	1986
849	907	2004
850	567	1991
851	892	1909
852	656	1962
853	19	1914
854	227	1952
855	801	1943
856	227	2002
857	924	1929
858	926	1968
859	178	1994
860	462	1942
861	638	1918
862	19	2004
863	79	1931
864	97	1955
865	696	1968
866	986	1989
867	593	2007
868	548	1985
869	845	1944
870	888	1915
871	971	2010
872	926	1920
873	942	2020
874	666	1929
875	130	1913
876	6	1996
877	630	1973
878	19	1943
879	831	1902
880	25	1933
881	653	1963
882	804	1970
883	296	1987
884	553	1956
885	878	1938
886	642	1961
887	649	1939
888	653	1950
889	11	1998
890	940	1950
891	286	2005
892	254	1995
893	290	1941
894	472	1989
895	789	1967
896	733	1952
897	640	1966
898	75	1913
899	241	1922
900	470	1907
901	914	1903
902	781	1919
903	898	1987
904	923	1954
905	107	1902
906	285	1946
907	146	1908
908	197	1959
909	47	1981
910	18	1969
911	599	1921
912	352	2005
913	351	1925
914	149	1921
915	842	2007
916	966	2008
917	668	1981
918	512	2021
919	635	1903
920	55	1931
921	435	2020
922	421	1967
923	122	1954
924	273	2008
925	231	1946
926	384	1973
927	527	1926
928	66	1914
929	126	1994
930	949	1970
931	24	1935
932	688	1955
933	993	1978
934	371	1956
935	328	1972
936	885	2014
937	486	1927
938	755	1949
939	608	1996
940	460	1916
941	441	2000
942	669	1951
943	469	1945
944	62	1924
945	555	1939
946	249	1976
947	612	1947
948	21	1924
949	507	1924
950	257	1909
951	299	1963
952	758	1972
953	655	1917
954	556	1985
955	232	1927
956	521	1937
957	396	1960
958	451	1910
959	736	1945
960	949	1994
961	945	1939
962	1000	1927
963	26	1985
964	178	2008
965	756	1915
966	275	1981
967	814	1998
968	842	1926
969	915	1923
970	63	1997
971	791	1929
972	820	1908
973	669	1990
974	237	2001
975	693	1976
976	811	1943
977	770	1922
978	855	1932
979	372	1960
980	739	1966
981	773	1985
982	597	2006
983	190	1957
984	811	1963
985	583	1956
986	223	1943
987	975	1922
988	592	1962
989	517	1924
990	468	1991
991	248	1924
992	171	1961
993	755	1909
994	698	1984
995	897	1931
996	372	1995
997	430	2019
998	638	2016
999	638	1901
1000	156	1976
\.


--
-- TOC entry 3633 (class 0 OID 27014)
-- Dependencies: 217
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (name, gpa, course_id) FROM stdin;
James Matt	0	11
Quincy Allen	3.86	8
Leo Scott	2.57	2
Ivy Collins	2.53	7
David Turner	3.25	1
Leo Scott	3.76	6
Ivy Collins	2.33	6
Henry Adams	3.53	10
Nathan Green	2.55	5
Bob Johnson	2.81	6
Bob Johnson	3.17	8
Frank Brown	2.93	3
Bob Johnson	2.29	1
Leo Scott	2.47	8
Bob Johnson	2.82	10
Carol Evans	2.23	7
Eva Martinez	3.57	4
Nathan Green	3.14	3
Karen Phillips	3.71	5
Jack Stewart	3.61	1
Jack Stewart	3.91	7
Alice Smith	3.03	5
Leo Scott	3.02	8
Rachel Lewis	2.15	1
Carol Evans	2.32	4
Grace Lee	3.49	1
David Turner	2.28	7
Jack Stewart	2.66	7
Frank Brown	2.56	8
Grace Lee	3.68	8
Frank Brown	3.61	4
Frank Brown	3.88	7
Jack Stewart	3.55	6
Carol Evans	3.43	7
Mona Hill	3.31	1
Jack Stewart	3.09	9
Alice Smith	2.48	4
Frank Brown	3.73	1
Ivy Collins	2.64	9
Alice Smith	2.68	8
Grace Lee	3.8	8
Bob Johnson	2.45	8
Rachel Lewis	3.82	2
Alice Smith	3.35	10
Jack Stewart	2.69	8
Alice Smith	3.58	5
David Turner	2.85	2
Alice Smith	3.95	10
Mona Hill	3.93	3
Rachel Lewis	3.73	5
Karen Phillips	2.8	10
Rachel Lewis	3.24	8
Henry Adams	2.03	8
Alice Smith	3.1	3
Bob Johnson	3.8	1
Karen Phillips	2.54	6
Ivy Collins	3.57	7
Henry Adams	2.41	5
Ivy Collins	3.78	8
David Turner	2.39	4
Quincy Allen	3.99	7
Nathan Green	3.27	10
Leo Scott	3.96	1
Jack Stewart	2.8	1
Alice Smith	2.64	7
Rachel Lewis	2.42	2
Nathan Green	3.37	7
Ivy Collins	3.92	3
Alice Smith	2.28	8
Rachel Lewis	3.78	8
Eva Martinez	2.24	9
Eva Martinez	2.34	7
Leo Scott	2.32	5
Jack Stewart	3.44	8
Leo Scott	2.35	4
Henry Adams	3.73	1
Paul Clark	2.21	8
Ivy Collins	3.9	9
Karen Phillips	2.66	6
Leo Scott	2.9	7
Mona Hill	3.83	7
David Turner	2.62	3
Nathan Green	3.66	3
Steve Carter	2.97	9
Quincy Allen	2.14	3
Olivia Wright	3.85	8
Mona Hill	2.64	2
Leo Scott	3.65	2
Paul Clark	2.63	10
Steve Carter	3.58	4
Ivy Collins	3.27	7
David Turner	3.84	5
Rachel Lewis	3.14	1
David Turner	2.95	9
David Turner	2.16	10
Leo Scott	3.18	7
Steve Carter	2.69	7
Leo Scott	3.05	3
Eva Martinez	2.29	1
Frank Brown	2.62	9
Paul Clark	3.51	6
Alice Smith	2.51	10
Nathan Green	3.65	1
Bob Johnson	2.3	8
Steve Carter	3.39	4
Ivy Collins	3.18	7
Quincy Allen	2.64	4
Carol Evans	3.43	2
Tina Walker	2.67	10
Grace Lee	2.27	8
Karen Phillips	3.26	4
Rachel Lewis	2.87	9
Bob Johnson	2.22	1
Rachel Lewis	2.91	6
Bob Johnson	2.58	6
Grace Lee	3.35	5
Henry Adams	3.69	3
Quincy Allen	2.33	8
Paul Clark	3.49	1
Steve Carter	2.17	7
Bob Johnson	3.2	10
Steve Carter	3.43	2
Nathan Green	3.58	4
Tina Walker	2.4	8
Paul Clark	3.02	4
Tina Walker	2.06	9
Rachel Lewis	3.04	1
Ivy Collins	2.16	2
Olivia Wright	3.45	3
Eva Martinez	3.78	7
Rachel Lewis	2.44	3
Mona Hill	2.58	6
Nathan Green	3.27	9
Nathan Green	2.71	10
Quincy Allen	3.53	8
Grace Lee	3.75	7
Steve Carter	3.46	3
Mona Hill	3.54	2
Henry Adams	2.33	5
Steve Carter	2.29	9
Karen Phillips	2.99	7
Bob Johnson	2.48	1
Karen Phillips	2.86	4
David Turner	3.72	3
Karen Phillips	2.41	7
Tina Walker	2.29	5
Tina Walker	3.78	1
Henry Adams	2.19	2
Tina Walker	2.69	10
Tina Walker	2.67	3
Quincy Allen	2.5	8
Henry Adams	2.02	3
Jack Stewart	2.45	4
Tina Walker	3.07	10
Quincy Allen	3.92	1
Bob Johnson	2.52	10
Carol Evans	2.43	10
Bob Johnson	3.38	5
Nathan Green	2.4	9
Carol Evans	2.43	2
Eva Martinez	2.69	4
Steve Carter	2.77	8
Mona Hill	3.54	1
Leo Scott	3.43	4
Paul Clark	2.38	3
Ivy Collins	2.36	9
Carol Evans	2.61	10
Alice Smith	3.05	1
Rachel Lewis	2.85	10
Karen Phillips	3.08	8
Jack Stewart	2.02	5
Henry Adams	2.35	2
Ivy Collins	3.31	6
Olivia Wright	2.63	3
Olivia Wright	2.75	2
Paul Clark	2.55	8
Karen Phillips	2.49	4
Eva Martinez	2.12	4
Jack Stewart	3.77	9
Carol Evans	3.53	9
Mona Hill	3.95	8
Jack Stewart	2.74	10
Rachel Lewis	2.09	8
Tina Walker	3.06	9
Henry Adams	2.82	3
Grace Lee	3.11	1
Quincy Allen	2.84	5
Henry Adams	2.09	1
Karen Phillips	2.15	1
Quincy Allen	2.54	6
Karen Phillips	2.91	7
Henry Adams	2.78	1
Mona Hill	2.29	1
Olivia Wright	3.47	7
Mona Hill	3.26	9
Leo Scott	2.77	8
Bob Johnson	3.62	6
Nathan Green	2.03	5
Carol Evans	3.91	1
Nathan Green	2.48	9
Jack Stewart	3.08	9
Nathan Green	3.42	4
Henry Adams	3.14	9
Paul Clark	3.97	9
Alice Smith	2.71	2
Ivy Collins	2.17	10
Ivy Collins	2.79	5
Tina Walker	2.9	6
Grace Lee	3.46	1
Nathan Green	3.33	5
Eva Martinez	2.48	5
Rachel Lewis	2.06	4
Paul Clark	2.58	1
Alice Smith	3.43	6
Bob Johnson	2.02	1
Carol Evans	3.06	6
Carol Evans	3.52	4
Steve Carter	3.4	7
Eva Martinez	2.76	6
Bob Johnson	3.59	6
David Turner	3.15	6
Carol Evans	3.36	10
Leo Scott	2.5	10
Frank Brown	3.67	9
Jack Stewart	3.17	9
Ivy Collins	2.45	8
Henry Adams	2.3	5
Paul Clark	3.12	5
Rachel Lewis	2.15	8
Henry Adams	3.5	1
Quincy Allen	3.87	5
Paul Clark	3.36	2
Rachel Lewis	2.8	1
Carol Evans	3.88	3
Mona Hill	3.74	9
Rachel Lewis	2.37	8
Tina Walker	2.25	9
Steve Carter	3.39	9
Alice Smith	3.6	1
Grace Lee	2.37	6
Eva Martinez	2.03	8
Tina Walker	2.11	6
Tina Walker	2.77	4
Leo Scott	2.46	4
Quincy Allen	2.64	3
Grace Lee	3.37	3
Quincy Allen	3.15	3
Olivia Wright	3.65	4
Grace Lee	3.82	5
Karen Phillips	3.19	9
Paul Clark	3.9	8
Nathan Green	3.05	5
Grace Lee	3.49	8
Alice Smith	2.65	7
Quincy Allen	3.09	7
Leo Scott	3.92	10
Carol Evans	3.97	5
Frank Brown	3.54	7
Grace Lee	2.1	10
Jack Stewart	3.68	5
Nathan Green	2.58	1
Tina Walker	2.66	7
Eva Martinez	2.8	8
Grace Lee	2.62	4
Eva Martinez	3.33	1
Alice Smith	3.37	4
Karen Phillips	3.38	8
Henry Adams	3.09	9
Henry Adams	3.17	9
Alice Smith	3.78	7
Grace Lee	3.26	2
Paul Clark	3.7	3
Henry Adams	3.58	8
Bob Johnson	3.02	10
Eva Martinez	3.08	7
Olivia Wright	2.53	1
Paul Clark	3.11	6
Nathan Green	2.21	6
David Turner	2.78	6
Tina Walker	3.35	10
Alice Smith	3.21	10
Steve Carter	3.1	9
Carol Evans	2.89	1
Paul Clark	3.83	2
Frank Brown	2.63	2
Mona Hill	3	10
Leo Scott	2.36	4
Rachel Lewis	2.42	1
Steve Carter	2.67	7
Tina Walker	3.42	3
Bob Johnson	2.86	3
Bob Johnson	2.67	2
Rachel Lewis	3.38	1
Olivia Wright	2.49	3
Karen Phillips	3.57	3
Jack Stewart	2.97	2
David Turner	2.2	10
Olivia Wright	2.62	2
Eva Martinez	3.46	2
Ivy Collins	3.15	2
Carol Evans	2.65	5
Eva Martinez	3.38	10
Rachel Lewis	3.47	7
Carol Evans	2.79	5
David Turner	3.94	9
Rachel Lewis	2.46	7
Carol Evans	4	6
Rachel Lewis	2.46	10
Steve Carter	3.06	6
Karen Phillips	3.88	7
Tina Walker	3.87	1
Eva Martinez	2.09	5
Tina Walker	3.45	9
Carol Evans	3.32	3
Nathan Green	2.87	2
Henry Adams	2.82	1
Frank Brown	2.52	8
Rachel Lewis	3.04	1
Ivy Collins	3.57	2
Leo Scott	2.22	1
Steve Carter	3.6	7
Karen Phillips	3.92	10
Steve Carter	2.77	7
Henry Adams	2.96	3
Ivy Collins	3.64	4
Henry Adams	2.2	3
Jack Stewart	3.06	2
Frank Brown	2.13	10
Nathan Green	2.5	7
Mona Hill	2.08	1
Steve Carter	3.03	4
Olivia Wright	3.26	1
Carol Evans	3.8	4
Mona Hill	2.99	7
Olivia Wright	3.93	1
Paul Clark	3.17	4
Rachel Lewis	3.33	1
Eva Martinez	3.33	3
Nathan Green	3.61	3
Henry Adams	3.38	5
Eva Martinez	2.02	2
Frank Brown	3.82	5
Olivia Wright	3.64	9
Grace Lee	3.93	4
David Turner	3.65	3
Olivia Wright	2.63	2
Frank Brown	2.81	5
Henry Adams	3.33	10
Jack Stewart	2.7	6
Ivy Collins	3.66	8
Rachel Lewis	3.43	1
Steve Carter	2.42	9
Olivia Wright	3.23	5
Quincy Allen	2.73	8
Carol Evans	3.15	8
Olivia Wright	3.77	6
Grace Lee	3.34	7
Jack Stewart	2.61	4
Steve Carter	2.25	3
Paul Clark	2.89	9
Carol Evans	2.44	8
Frank Brown	2.13	9
Nathan Green	3.1	8
Henry Adams	2.03	2
Eva Martinez	2.32	4
Leo Scott	3.37	5
Karen Phillips	3.14	8
Paul Clark	3.95	2
Alice Smith	2.69	5
Carol Evans	2.14	10
Olivia Wright	2.9	8
Alice Smith	3.92	8
Frank Brown	2.97	7
Nathan Green	2.26	4
Paul Clark	3.02	1
Leo Scott	2.69	6
Nathan Green	3.27	2
Ivy Collins	3.51	5
Karen Phillips	3.55	8
Nathan Green	2.82	3
Steve Carter	3.76	9
Rachel Lewis	3.62	3
Grace Lee	2.79	10
Tina Walker	3.46	4
Nathan Green	2.25	7
Henry Adams	2.57	2
Nathan Green	3.82	9
Alice Smith	2.8	3
Tina Walker	2.4	1
Jack Stewart	2.6	2
Rachel Lewis	2.44	3
Nathan Green	2.64	1
Carol Evans	2.62	7
Rachel Lewis	3.78	10
Tina Walker	2.01	6
Grace Lee	2.06	9
Paul Clark	3.49	1
Rachel Lewis	2.82	9
Eva Martinez	3.68	3
Frank Brown	3.88	9
David Turner	2.43	10
Grace Lee	3.54	9
Jack Stewart	3.8	9
Paul Clark	3.28	4
Bob Johnson	3.61	2
Rachel Lewis	3.04	8
Carol Evans	3.22	2
Jack Stewart	2.82	7
Jack Stewart	2.41	1
Olivia Wright	3.67	8
Jack Stewart	2.53	8
Steve Carter	3.72	10
Paul Clark	2.21	7
Steve Carter	2.91	7
Ivy Collins	3.18	10
Olivia Wright	3.81	3
Eva Martinez	2.49	7
Eva Martinez	2.07	6
Tina Walker	2.73	2
David Turner	3.51	1
Leo Scott	3.95	2
David Turner	2.5	10
Mona Hill	3.04	9
David Turner	3.95	4
Tina Walker	3.94	3
Quincy Allen	2.14	5
David Turner	3.1	8
Nathan Green	3.36	8
Carol Evans	2.27	1
Eva Martinez	2.83	9
Alice Smith	3.69	4
Bob Johnson	2.5	5
David Turner	2.99	2
Mona Hill	3.39	7
Grace Lee	2.37	6
Grace Lee	3.01	5
Nathan Green	2.63	1
Carol Evans	3.06	4
Quincy Allen	3.79	9
Jack Stewart	3.07	6
Tina Walker	2.19	3
Quincy Allen	3.67	1
Karen Phillips	2.61	1
Grace Lee	2.33	1
Ivy Collins	3	6
Leo Scott	3.93	2
Bob Johnson	3.22	4
Quincy Allen	2.27	1
Tina Walker	2.73	1
Karen Phillips	3.08	5
Eva Martinez	2.14	5
Eva Martinez	3.92	2
Rachel Lewis	3.34	5
David Turner	2.32	10
Frank Brown	3.81	6
Frank Brown	3.36	4
Jack Stewart	3.66	1
Mona Hill	2.55	7
Jack Stewart	3.73	8
Frank Brown	3.71	2
Steve Carter	3.57	10
Frank Brown	2.46	10
Jack Stewart	2.21	8
Jack Stewart	2.07	7
Grace Lee	3.13	3
Quincy Allen	3.87	8
Jack Stewart	3.84	6
Carol Evans	3.07	9
Jack Stewart	3.67	2
Steve Carter	2.35	1
Karen Phillips	2.16	10
Rachel Lewis	3.15	3
Bob Johnson	2.79	10
Tina Walker	3.15	9
Eva Martinez	3.5	9
Rachel Lewis	2.17	2
Tina Walker	2.99	9
Eva Martinez	2.69	7
Quincy Allen	3.8	8
Henry Adams	3.17	1
Paul Clark	2.92	5
Paul Clark	2.86	2
Alice Smith	2.96	6
Nathan Green	3.9	2
Alice Smith	2.6	2
David Turner	3	1
Grace Lee	2.02	5
Eva Martinez	3.37	9
Tina Walker	2.12	1
Steve Carter	2.16	7
Leo Scott	3.73	5
Carol Evans	2.07	5
Leo Scott	2.13	7
Eva Martinez	3.95	10
Paul Clark	2.4	3
Henry Adams	2.09	6
Ivy Collins	2.72	6
Henry Adams	2.23	10
Leo Scott	2.41	6
Paul Clark	2.44	7
Leo Scott	2.78	3
Frank Brown	3.39	6
Karen Phillips	2.54	8
Grace Lee	3.78	9
Leo Scott	2.11	4
Tina Walker	2.43	8
Leo Scott	2.18	3
Olivia Wright	2.49	6
Ivy Collins	2.69	1
Henry Adams	2.14	6
Carol Evans	3.78	7
Mona Hill	2.76	1
Tina Walker	3.96	3
Quincy Allen	2.01	5
Karen Phillips	2.8	7
Olivia Wright	2.73	4
Olivia Wright	3.54	2
Quincy Allen	2.51	3
Leo Scott	2.77	4
Jack Stewart	3.86	5
Steve Carter	3.74	8
Alice Smith	2.18	2
Alice Smith	3.71	5
Karen Phillips	2.46	5
Jack Stewart	3.33	7
Tina Walker	2.03	10
Paul Clark	3.09	10
Steve Carter	3.88	1
Leo Scott	2.84	6
Mona Hill	3.79	6
Ivy Collins	2.23	5
Leo Scott	2.89	3
Karen Phillips	2.48	1
Frank Brown	2.44	7
Nathan Green	3.43	9
Carol Evans	2.01	8
Henry Adams	3.59	5
Mona Hill	3.15	9
Olivia Wright	3.53	2
Nathan Green	2.92	1
Bob Johnson	3.19	4
Bob Johnson	2.29	10
Nathan Green	3.19	4
Grace Lee	2.44	2
Frank Brown	3.13	5
Karen Phillips	3.16	4
David Turner	2.91	4
Nathan Green	2.72	5
Carol Evans	2.29	3
David Turner	2.78	7
Steve Carter	2.54	4
Frank Brown	3.84	1
Olivia Wright	2.01	2
Tina Walker	3.35	1
Mona Hill	3.84	4
Grace Lee	3.58	5
Steve Carter	3.61	5
Frank Brown	2.32	1
Eva Martinez	3.51	7
Grace Lee	2.64	9
Paul Clark	3.91	3
Grace Lee	2.41	4
Carol Evans	3.55	10
Eva Martinez	2.55	4
Leo Scott	2.84	5
Mona Hill	3.89	6
Henry Adams	3.3	1
Tina Walker	3.88	6
Quincy Allen	2.72	2
Frank Brown	3.94	3
Steve Carter	2.86	5
Ivy Collins	2.37	6
Bob Johnson	2.74	4
Leo Scott	3.06	2
Bob Johnson	3.55	4
Quincy Allen	2.28	5
Mona Hill	3.47	3
Grace Lee	3.81	6
Karen Phillips	2.48	4
Grace Lee	3.73	9
Grace Lee	3.74	8
Tina Walker	3.51	2
Alice Smith	2.17	3
Ivy Collins	2.35	7
Bob Johnson	2.69	8
Ivy Collins	2.1	5
Jack Stewart	2.06	9
Frank Brown	2.56	10
Tina Walker	3.87	2
Jack Stewart	2.54	10
Bob Johnson	2.38	6
Paul Clark	2.7	7
Bob Johnson	2.33	8
Steve Carter	2.41	8
Grace Lee	3.76	5
Paul Clark	2.26	9
Ivy Collins	3.08	10
Bob Johnson	2.7	9
Leo Scott	3.53	9
Grace Lee	3.71	9
Nathan Green	2.83	7
Steve Carter	2.87	6
Frank Brown	2.63	3
Ivy Collins	3.01	6
Carol Evans	3.51	7
Tina Walker	2.39	3
Quincy Allen	2.43	1
Paul Clark	3.05	10
Tina Walker	3.98	5
Steve Carter	3.81	8
Eva Martinez	2.84	10
Leo Scott	3.93	9
Mona Hill	2.11	4
Karen Phillips	3.89	4
David Turner	2.39	5
Steve Carter	3.99	2
Jack Stewart	3.32	2
Alice Smith	2.98	7
Nathan Green	2.08	6
Olivia Wright	3.78	7
Grace Lee	2.15	1
Tina Walker	2.49	6
Karen Phillips	3.24	6
Grace Lee	2.8	2
Karen Phillips	3.61	9
Alice Smith	3.63	3
Tina Walker	2.26	4
Alice Smith	2.13	8
Olivia Wright	2.29	5
Nathan Green	3.89	10
Quincy Allen	3.94	3
Olivia Wright	3.87	8
Grace Lee	3.21	2
Tina Walker	3.52	7
Steve Carter	2.48	2
Rachel Lewis	3.86	7
Leo Scott	2.62	2
Tina Walker	3.86	7
Olivia Wright	3.16	4
Leo Scott	2.31	9
Tina Walker	3.42	1
Olivia Wright	2.37	5
Bob Johnson	3.57	9
Leo Scott	3.24	3
Frank Brown	2.78	5
Henry Adams	2.92	2
Grace Lee	3.86	8
Rachel Lewis	3.59	6
Tina Walker	2.43	9
Mona Hill	2.26	5
Nathan Green	2.07	3
Grace Lee	3.04	9
Rachel Lewis	2.38	7
Quincy Allen	3.72	3
Frank Brown	3.12	7
Karen Phillips	2.9	4
Grace Lee	2.15	2
Mona Hill	3.74	3
Eva Martinez	3.4	8
David Turner	3.64	10
Quincy Allen	3.29	5
David Turner	2.48	7
Quincy Allen	2.77	4
Bob Johnson	3.33	2
Alice Smith	2.66	8
Eva Martinez	2.99	10
Karen Phillips	2.8	9
Tina Walker	2.1	6
Bob Johnson	2.17	2
Mona Hill	3.06	4
Nathan Green	3.27	8
Eva Martinez	3.66	7
Bob Johnson	2.46	4
Carol Evans	3.71	5
Mona Hill	3.8	7
Paul Clark	2.43	1
Tina Walker	3.04	3
Mona Hill	3.15	9
Paul Clark	3.39	7
Jack Stewart	3.48	5
Ivy Collins	2.27	7
Grace Lee	3	4
Paul Clark	3.92	10
Rachel Lewis	2.04	2
Mona Hill	3.84	7
Olivia Wright	3.5	7
Alice Smith	2.28	2
Olivia Wright	3.68	7
Paul Clark	3.4	4
Steve Carter	2.4	1
Jack Stewart	3.13	1
Steve Carter	2.06	3
Steve Carter	2.58	8
Carol Evans	2.16	2
Rachel Lewis	2.63	5
Henry Adams	3.55	6
Eva Martinez	2.36	1
Paul Clark	3.48	5
Mona Hill	2.6	2
Karen Phillips	3.86	5
Paul Clark	3.2	6
David Turner	2.05	1
Steve Carter	3.39	6
Karen Phillips	2.7	6
Frank Brown	2.58	1
Alice Smith	3.62	10
Jack Stewart	2.21	10
Jack Stewart	2.17	7
Nathan Green	2.89	3
Olivia Wright	2.97	7
Paul Clark	2.43	7
Rachel Lewis	3.4	10
Carol Evans	2.86	10
Alice Smith	2.85	7
Eva Martinez	2.25	6
Eva Martinez	3.98	1
David Turner	3.48	2
Frank Brown	3.61	4
Tina Walker	2.54	2
Nathan Green	2.32	3
Olivia Wright	2.83	8
Eva Martinez	2.21	2
Quincy Allen	3.91	9
Olivia Wright	3.66	4
Henry Adams	3.05	10
Bob Johnson	3.78	1
Eva Martinez	3.28	9
Mona Hill	3.73	8
Olivia Wright	2.27	8
Paul Clark	2.34	8
Jack Stewart	2.3	1
Eva Martinez	3.26	5
Rachel Lewis	3.71	6
Grace Lee	3.39	4
Nathan Green	3.35	2
Jack Stewart	3.57	10
Tina Walker	2.96	4
Steve Carter	3.64	2
Leo Scott	3.27	8
Paul Clark	3.15	10
Bob Johnson	3.93	1
Eva Martinez	3.53	6
Eva Martinez	3.02	1
Olivia Wright	2.05	10
Henry Adams	2.11	8
Leo Scott	3.5	3
Bob Johnson	2.98	7
Paul Clark	2.31	8
Steve Carter	2.3	9
Jack Stewart	2.33	7
Leo Scott	3.08	2
Karen Phillips	3.23	5
Eva Martinez	2.28	7
Ivy Collins	2.44	5
Tina Walker	2.91	2
Olivia Wright	2.6	9
Olivia Wright	3.39	3
Quincy Allen	3.31	9
Olivia Wright	3.8	3
Frank Brown	2.03	5
Mona Hill	3.04	6
Olivia Wright	3.89	4
Leo Scott	2.34	6
Carol Evans	3.37	2
Bob Johnson	2.35	9
Jack Stewart	2.03	3
Steve Carter	2.37	1
Carol Evans	2.2	5
Frank Brown	3.56	1
Alice Smith	3.82	1
Paul Clark	3.43	8
Jack Stewart	2.15	7
Nathan Green	3.02	8
Eva Martinez	2.08	6
Henry Adams	2.56	10
Henry Adams	3.76	7
Nathan Green	3.94	6
Nathan Green	2.05	2
Grace Lee	2.64	6
Steve Carter	3.18	10
Grace Lee	3.29	8
David Turner	2.27	6
Steve Carter	3.47	2
Grace Lee	3.49	7
Ivy Collins	3.12	9
Carol Evans	3.86	5
Rachel Lewis	2.23	6
Eva Martinez	2.92	7
Nathan Green	3.99	5
Jack Stewart	3.04	6
Nathan Green	3.68	4
David Turner	2.05	3
Rachel Lewis	3.12	7
David Turner	2.63	9
Tina Walker	3.73	9
Frank Brown	2.72	4
Grace Lee	2.56	7
Steve Carter	3.48	1
Frank Brown	2.52	1
Tina Walker	3.09	4
Alice Smith	2.35	4
Quincy Allen	2.05	8
Jack Stewart	2.66	9
Eva Martinez	3.98	1
Tina Walker	3.89	9
Karen Phillips	2.11	4
Quincy Allen	2.81	2
Rachel Lewis	3.48	10
Olivia Wright	3.48	10
Ivy Collins	3.11	6
David Turner	2.03	9
Jack Stewart	3.97	8
Bob Johnson	2.96	4
Frank Brown	3.63	3
Olivia Wright	3.56	3
Alice Smith	2.99	7
Steve Carter	2.1	7
Leo Scott	3.51	3
Leo Scott	3.77	6
Mona Hill	2.9	10
Nathan Green	2.61	4
Tina Walker	3.58	7
Grace Lee	3.78	7
Eva Martinez	3.04	8
Paul Clark	2.26	2
Steve Carter	2.67	2
Carol Evans	3.21	6
Karen Phillips	3.7	4
Henry Adams	2.28	1
Mona Hill	3.14	9
Paul Clark	3.82	9
Steve Carter	2.3	2
Paul Clark	2.4	3
Rachel Lewis	3.63	10
Eva Martinez	2.81	3
Jack Stewart	2.1	4
Quincy Allen	2.57	9
Bob Johnson	2.31	10
Frank Brown	3.86	2
Bob Johnson	2.25	1
Ivy Collins	3.87	2
Grace Lee	2.55	1
Grace Lee	3.44	8
Eva Martinez	2.75	3
Mona Hill	3.88	10
Frank Brown	3.2	9
Mona Hill	2.66	8
Grace Lee	3.8	3
Tina Walker	2.17	6
Nathan Green	2.42	7
Quincy Allen	3.76	7
Jack Stewart	3.09	5
Olivia Wright	3.68	5
Grace Lee	2.47	7
Karen Phillips	2.19	3
Paul Clark	3.56	4
Nathan Green	2.3	5
Leo Scott	3.62	2
Mona Hill	2.51	1
Alice Smith	3.14	8
Mona Hill	2.66	4
Karen Phillips	2.91	4
Leo Scott	2.82	7
Leo Scott	2.31	8
Tina Walker	3.21	6
Jack Stewart	3.67	1
Tina Walker	2.19	9
Steve Carter	2.71	9
Steve Carter	2.57	7
Olivia Wright	2.07	1
David Turner	3.54	10
Rachel Lewis	3	3
Alice Smith	3.12	8
Frank Brown	3.03	2
Paul Clark	2.09	5
Frank Brown	2.8	1
Paul Clark	3.62	9
Henry Adams	2.88	2
Jack Stewart	2.43	3
Olivia Wright	2.76	8
Frank Brown	2.01	6
Eva Martinez	2.5	4
Alice Smith	2.62	8
Tina Walker	2.58	6
Paul Clark	3.82	8
Paul Clark	3.57	10
Alice Smith	2.34	5
Nathan Green	3.47	2
Leo Scott	2.47	2
Steve Carter	2.04	9
Paul Clark	2.04	10
Olivia Wright	2.45	9
David Turner	3.84	9
Ivy Collins	2.12	5
Mona Hill	2.51	6
Frank Brown	3.32	10
Ivy Collins	3.99	1
Carol Evans	3.97	6
Olivia Wright	3.08	2
Paul Clark	2.48	8
Olivia Wright	3.93	10
Frank Brown	3.02	7
Quincy Allen	3.74	9
Eva Martinez	3.88	2
Paul Clark	3.03	9
Olivia Wright	3.5	9
Paul Clark	2.88	10
David Turner	3.76	5
Frank Brown	2.51	2
Rachel Lewis	2.14	10
Quincy Allen	2.77	9
Olivia Wright	2.32	4
Nathan Green	3.64	6
Rachel Lewis	2.72	9
Mona Hill	2.49	5
Alice Smith	3.63	7
Frank Brown	3.57	10
David Turner	2.92	6
Carol Evans	2.98	10
Jack Stewart	3.11	1
Leo Scott	3.58	9
Frank Brown	3.05	2
Mona Hill	3.73	10
Bob Johnson	2.75	10
Carol Evans	3.95	1
Ivy Collins	3.23	5
Tina Walker	3.09	1
Grace Lee	2.17	5
Frank Brown	2.64	5
Grace Lee	3.95	7
Grace Lee	2.45	5
Eva Martinez	2.18	4
Ivy Collins	2.89	7
David Turner	2.15	8
Carol Evans	3.48	9
Paul Clark	2.65	4
Steve Carter	2.38	4
Karen Phillips	3.5	1
Alice Smith	3.96	8
Mona Hill	2.98	2
Steve Carter	2.39	10
Nathan Green	3.03	1
Leo Scott	3.33	7
Jack Stewart	2.93	8
Leo Scott	2.24	8
Carol Evans	2.45	10
Eva Martinez	2.33	9
Karen Phillips	3.73	7
Bob Johnson	2.75	1
Olivia Wright	3.76	10
Bob Johnson	3.43	5
Olivia Wright	3.5	10
Eva Martinez	2.63	1
Grace Lee	3.56	9
Frank Brown	3.39	5
Grace Lee	3.18	5
Karen Phillips	2.9	1
Ivy Collins	2.5	3
Grace Lee	3.96	7
Olivia Wright	3.26	8
Carol Evans	2.6	9
Rachel Lewis	3.72	6
Steve Carter	2.62	1
Henry Adams	2.25	2
Jack Stewart	3.35	3
Mona Hill	2.63	3
Nathan Green	2.97	6
Rachel Lewis	2.75	4
Frank Brown	3.14	3
Frank Brown	3.45	3
Carol Evans	2.14	6
Steve Carter	2.58	8
Mona Hill	2.16	2
Steve Carter	2.15	1
Grace Lee	2.47	3
Henry Adams	3.56	10
Rachel Lewis	3.51	9
Henry Adams	3.38	7
Frank Brown	3.56	10
Leo Scott	2.77	2
Ivy Collins	2.01	10
Tina Walker	3.61	4
Paul Clark	3.86	1
Nathan Green	3.82	6
Nathan Green	2.99	4
Grace Lee	2.15	3
Quincy Allen	3.63	1
David Turner	3.47	4
Henry Adams	3.49	8
Jack Stewart	3.29	8
Jack Stewart	2.02	2
Paul Clark	3.88	2
Steve Carter	2.72	5
Carol Evans	2.62	9
Grace Lee	2.12	2
Steve Carter	3.09	10
Bob Johnson	3.54	9
Bob Johnson	3.21	3
Eva Martinez	3.42	5
Paul Clark	3.89	3
Paul Clark	3.49	5
\.


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 215
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 1, false);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 219
-- Name: login_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_info_id_seq', 1000, true);


--
-- TOC entry 3479 (class 2606 OID 27104)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 3473 (class 2606 OID 27013)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 27030)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 3477 (class 2606 OID 27037)
-- Name: login_info login_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_info
    ADD CONSTRAINT login_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3483 (class 2606 OID 27119)
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (playlist_id);


--
-- TOC entry 3481 (class 2606 OID 27109)
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- TOC entry 3485 (class 2606 OID 27038)
-- Name: login_info login_info_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_info
    ADD CONSTRAINT login_info_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id) ON DELETE CASCADE;


--
-- TOC entry 3487 (class 2606 OID 27120)
-- Name: playlists playlists_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id) ON DELETE CASCADE;


--
-- TOC entry 3486 (class 2606 OID 27110)
-- Name: songs songs_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id) ON DELETE CASCADE;


--
-- TOC entry 3484 (class 2606 OID 27017)
-- Name: student student_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);


-- Completed on 2024-10-30 23:17:18 PDT

--
-- PostgreSQL database dump complete
--

