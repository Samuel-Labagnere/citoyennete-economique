--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO sam;

--
-- Name: evaluations; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.evaluations (
    id bigint NOT NULL,
    organisation_id bigint,
    annee integer,
    pouvoir_gouvernance_part_salaries_associes double precision,
    pouvoir_gouvernance_taux_societariat_femmes double precision,
    pouvoir_gouvernance_part_salaries_conseil double precision,
    pouvoir_gouvernance_part_femmes_conseil double precision,
    pouvoir_gouvernance_diversite_categories character varying[],
    pouvoir_democratie_nombre_reunions integer,
    pouvoir_democratie_taux_participation_formations double precision,
    pouvoir_democratie_nombre_accords_signes integer,
    pouvoir_democratie_accords_signes text,
    pouvoir_strategique_taux_presence_assemblee double precision,
    pouvoir_strategique_actifs_total double precision,
    pouvoir_estimation_realite integer,
    valeur_perennite_part_capital_salaries double precision,
    valeur_perennite_existence_reserve boolean,
    valeur_perennite_reserve_impartageable boolean,
    valeur_perennite_part_resultat_reserve double precision,
    valeur_perennite_ebe_caht double precision,
    valeur_perennite_part_endettement double precision,
    valeur_perennite_attention_questions_innovation boolean,
    valeur_partage_part_resultat_net_actionnaires double precision,
    valeur_partage_existence_accord boolean,
    valeur_partage_existence_epargne_salariale boolean,
    valeur_partage_part_resultat_salaries double precision,
    valeur_partage_existence_grille_salariale boolean,
    valeur_partage_publicite_grille boolean,
    valeur_partage_ecart_revenus_hauts_bas double precision,
    valeur_partage_index_egalite_homme_femme integer,
    valeur_estimation_realite integer,
    qualite_qvt_enquete_qvt boolean,
    qualite_qvt_taux_qvt double precision,
    qualite_qvt_part_cdi double precision,
    qualite_qvt_moyenne_anciennete integer,
    qualite_qvt_taux_turnover double precision,
    qualite_qvt_taux_absenteisme double precision,
    qualite_emancipation_moyenne_heures_formation double precision,
    qualite_emancipation_taux_budget_formation_masse_salariale double precision,
    qualite_emancipation_taux_direction_promotion_interne double precision,
    qualite_estimation_realite integer,
    impact_environnement_audit_impact boolean,
    impact_environnement_demarche_ecologique boolean,
    impact_environnement_part_energies_renouvelables double precision,
    impact_environnement_part_salaries_mobilite double precision,
    impact_environnement_discussion_impact boolean,
    impact_environnement_bilan_carbone_scope_1 boolean,
    impact_environnement_bilan_carbone_scope_2 boolean,
    impact_environnement_bilan_carbone_scope_3 boolean,
    impact_social_part_activite_structures_insertion double precision,
    impact_social_alternance_apprentissage double precision,
    impact_social_part_seniors double precision,
    impact_social_part_handicap double precision,
    impact_engagement_part_resultat_missions_utiles double precision,
    impact_engagement_part_placements_responsables double precision,
    impact_engagement_part_impots_france double precision,
    impact_engagement_demarche_ethique_fournisseurs boolean,
    impact_estimation_realite integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    pouvoir_strategique_implication_partage double precision,
    pouvoir_gouvernance_taux_droits_vote_salaries double precision,
    chiffre_affaires double precision,
    resultat_net double precision,
    nombre_salaries integer,
    nombre_salaries_etp integer
);


ALTER TABLE public.evaluations OWNER TO sam;

--
-- Name: evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluations_id_seq OWNER TO sam;

--
-- Name: evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.evaluations_id_seq OWNED BY public.evaluations.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.organisations (
    id bigint NOT NULL,
    nom character varying NOT NULL,
    statut_juridique integer NOT NULL,
    date_creation integer NOT NULL,
    secteur_activite character varying NOT NULL,
    ape character varying NOT NULL,
    siren character varying NOT NULL,
    agrement_specifique character varying,
    objectifs_extra_financiers boolean,
    distinctions text,
    valeurs_entreprise character varying,
    validation_admin boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.organisations OWNER TO sam;

--
-- Name: organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organisations_id_seq OWNER TO sam;

--
-- Name: organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.organisations_id_seq OWNED BY public.organisations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO sam;

--
-- Name: users; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    organisation_id bigint,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    is_super_admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO sam;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO sam;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: evaluations id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.evaluations ALTER COLUMN id SET DEFAULT nextval('public.evaluations_id_seq'::regclass);


--
-- Name: organisations id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.organisations ALTER COLUMN id SET DEFAULT nextval('public.organisations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: sam
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-04-04 12:51:06.883844	2022-04-04 12:51:06.883844
\.


--
-- Data for Name: evaluations; Type: TABLE DATA; Schema: public; Owner: sam
--

COPY public.evaluations (id, organisation_id, annee, pouvoir_gouvernance_part_salaries_associes, pouvoir_gouvernance_taux_societariat_femmes, pouvoir_gouvernance_part_salaries_conseil, pouvoir_gouvernance_part_femmes_conseil, pouvoir_gouvernance_diversite_categories, pouvoir_democratie_nombre_reunions, pouvoir_democratie_taux_participation_formations, pouvoir_democratie_nombre_accords_signes, pouvoir_democratie_accords_signes, pouvoir_strategique_taux_presence_assemblee, pouvoir_strategique_actifs_total, pouvoir_estimation_realite, valeur_perennite_part_capital_salaries, valeur_perennite_existence_reserve, valeur_perennite_reserve_impartageable, valeur_perennite_part_resultat_reserve, valeur_perennite_ebe_caht, valeur_perennite_part_endettement, valeur_perennite_attention_questions_innovation, valeur_partage_part_resultat_net_actionnaires, valeur_partage_existence_accord, valeur_partage_existence_epargne_salariale, valeur_partage_part_resultat_salaries, valeur_partage_existence_grille_salariale, valeur_partage_publicite_grille, valeur_partage_ecart_revenus_hauts_bas, valeur_partage_index_egalite_homme_femme, valeur_estimation_realite, qualite_qvt_enquete_qvt, qualite_qvt_taux_qvt, qualite_qvt_part_cdi, qualite_qvt_moyenne_anciennete, qualite_qvt_taux_turnover, qualite_qvt_taux_absenteisme, qualite_emancipation_moyenne_heures_formation, qualite_emancipation_taux_budget_formation_masse_salariale, qualite_emancipation_taux_direction_promotion_interne, qualite_estimation_realite, impact_environnement_audit_impact, impact_environnement_demarche_ecologique, impact_environnement_part_energies_renouvelables, impact_environnement_part_salaries_mobilite, impact_environnement_discussion_impact, impact_environnement_bilan_carbone_scope_1, impact_environnement_bilan_carbone_scope_2, impact_environnement_bilan_carbone_scope_3, impact_social_part_activite_structures_insertion, impact_social_alternance_apprentissage, impact_social_part_seniors, impact_social_part_handicap, impact_engagement_part_resultat_missions_utiles, impact_engagement_part_placements_responsables, impact_engagement_part_impots_france, impact_engagement_demarche_ethique_fournisseurs, impact_estimation_realite, created_at, updated_at, pouvoir_strategique_implication_partage, pouvoir_gouvernance_taux_droits_vote_salaries, chiffre_affaires, resultat_net, nombre_salaries, nombre_salaries_etp) FROM stdin;
1	1	2022	54	54	89	57	{Salariés,"Pouvoirs publics",Associations}	98	12	123	26	46	38	9	55	t	f	12	2378634	76	t	54	\N	f	54	f	f	5000	100	2	t	100	500	0	0	1	5	80	10	5	f	f	98	15	f	f	f	f	56	61	95	23	98	54	32	f	8	2022-04-04 14:27:13.392601	2022-04-04 14:27:13.392601	11	78	460000	\N	549	\N
\.


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: sam
--

COPY public.organisations (id, nom, statut_juridique, date_creation, secteur_activite, ape, siren, agrement_specifique, objectifs_extra_financiers, distinctions, valeurs_entreprise, validation_admin, created_at, updated_at) FROM stdin;
1	Sam Entreprise	3	2022	Test	TEST	TEST		\N			t	2022-04-04 14:20:10.153192	2022-04-04 14:20:10.153192
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sam
--

COPY public.schema_migrations (version) FROM stdin;
20220322111554
20220322112530
20220322114540
20220322142211
20220323033336
20220323144505
20220323145346
20220324115630
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sam
--

COPY public.users (id, organisation_id, email, encrypted_password, first_name, last_name, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, is_super_admin) FROM stdin;
1	1	samsam@sam.sam	$2a$12$/J7iaQ8Zaql.78.8kp9MPegpyJj4gBtlt.FOmdhrdSYYtPX8wG6xG	Sam	Sam	\N	\N	\N	2022-04-04 14:18:50.914257	2022-04-04 14:20:10.160664	f
\.


--
-- Name: evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.evaluations_id_seq', 1, true);


--
-- Name: organisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.organisations_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: evaluations evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_pkey PRIMARY KEY (id);


--
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_evaluations_on_annee; Type: INDEX; Schema: public; Owner: sam
--

CREATE UNIQUE INDEX index_evaluations_on_annee ON public.evaluations USING btree (annee);


--
-- Name: index_evaluations_on_organisation_id; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX index_evaluations_on_organisation_id ON public.evaluations USING btree (organisation_id);


--
-- Name: index_organisations_on_siren; Type: INDEX; Schema: public; Owner: sam
--

CREATE UNIQUE INDEX index_organisations_on_siren ON public.organisations USING btree (siren);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: sam
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_organisation_id; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX index_users_on_organisation_id ON public.users USING btree (organisation_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: sam
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

