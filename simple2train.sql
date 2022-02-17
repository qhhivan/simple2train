--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: teilnehmer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teilnehmer (
    teilnehmer_id integer NOT NULL,
    vorname character varying(50) NOT NULL,
    nachname character varying(50) NOT NULL,
    geburtsdatum date NOT NULL,
    email character varying(50) NOT NULL,
    passwort character varying(25) NOT NULL
);


ALTER TABLE public.teilnehmer OWNER TO postgres;

--
-- Name: teilnehmer_teilnehmer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teilnehmer_teilnehmer_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teilnehmer_teilnehmer_id_seq OWNER TO postgres;

--
-- Name: teilnehmer_teilnehmer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teilnehmer_teilnehmer_id_seq OWNED BY public.teilnehmer.teilnehmer_id;


--
-- Name: teilnehmer_training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teilnehmer_training (
    trainings_id integer NOT NULL,
    teilnehmer_id integer NOT NULL,
    status character varying(15) DEFAULT 'ausstehend'::character varying NOT NULL
);


ALTER TABLE public.teilnehmer_training OWNER TO postgres;

--
-- Name: trainer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainer (
    trainer_id integer NOT NULL,
    vorname character varying(50) NOT NULL,
    nachname character varying(50) NOT NULL,
    geburtsdatum date NOT NULL,
    email character varying(50) NOT NULL,
    passwort character varying(25) NOT NULL
);


ALTER TABLE public.trainer OWNER TO postgres;

--
-- Name: trainer_trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainer_trainer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainer_trainer_id_seq OWNER TO postgres;

--
-- Name: trainer_trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainer_trainer_id_seq OWNED BY public.trainer.trainer_id;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainings (
    trainings_id integer NOT NULL,
    datum date NOT NULL,
    beginn time without time zone NOT NULL,
    ort character varying(100) NOT NULL,
    kosten numeric(5,2) DEFAULT 0 NOT NULL,
    minimum smallint DEFAULT 0 NOT NULL,
    maximum smallint NOT NULL,
    trainer_id integer NOT NULL,
    ende time without time zone NOT NULL,
    eintragefrist date NOT NULL,
    CONSTRAINT spieleranzahl CHECK ((maximum >= minimum))
);


ALTER TABLE public.trainings OWNER TO postgres;

--
-- Name: trainings_trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainings_trainings_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainings_trainings_id_seq OWNER TO postgres;

--
-- Name: trainings_trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainings_trainings_id_seq OWNED BY public.trainings.trainings_id;


--
-- Name: teilnehmer teilnehmer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teilnehmer ALTER COLUMN teilnehmer_id SET DEFAULT nextval('public.teilnehmer_teilnehmer_id_seq'::regclass);


--
-- Name: trainer trainer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer ALTER COLUMN trainer_id SET DEFAULT nextval('public.trainer_trainer_id_seq'::regclass);


--
-- Name: trainings trainings_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings ALTER COLUMN trainings_id SET DEFAULT nextval('public.trainings_trainings_id_seq'::regclass);


--
-- Data for Name: teilnehmer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teilnehmer (teilnehmer_id, vorname, nachname, geburtsdatum, email, passwort) FROM stdin;
4	Moritz	Miedler	2003-03-17	miedler.m03@htlwienwest.at	simple2trainmoritz
5	Victor	Pawlek	2003-02-01	pawlek.v02@htlwienwest.at	simple2trainvictor
2	Adrian	Myslwiec	2002-07-02	mysliwiec.a02@htlwienwest.at	simple2trainadrian
1	Ivan	Orsolic	2002-01-01	orsolic.i02@htlwienwest.at	simple2trainivan
3	Mina	Mansour	2002-01-01	mansour.m02@htlwienwest.at	simple2trainmina
\.


--
-- Data for Name: teilnehmer_training; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teilnehmer_training (trainings_id, teilnehmer_id, status) FROM stdin;
1	1	ausstehend
1	2	zugesagt
2	4	ausstehend
3	1	ausstehend
3	2	ausstehend
3	4	ausstehend
3	5	ausstehend
1	3	ausstehend
1	4	abgelehnt
1	5	zugesagt
2	3	abgelehnt
2	1	zugesagt
2	5	abgelehnt
2	2	zugesagt
3	3	zugesagt
\.


--
-- Data for Name: trainer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainer (trainer_id, vorname, nachname, geburtsdatum, email, passwort) FROM stdin;
1	Haroon	Younas	2003-04-03	younas.h03@htlwienwest.at	simple2trainhar
2	Krystian	Chwaja	2003-01-14	chwaja.k03@htlwienwest.at	simple2trainkrystian
3	Svetlin	Severelov	2001-06-01	severelov.s01@htlwienwest.at	simple2trainsvetlin
\.


--
-- Data for Name: trainings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainings (trainings_id, datum, beginn, ort, kosten, minimum, maximum, trainer_id, ende, eintragefrist) FROM stdin;
1	2021-11-11	14:50:00	HTL Wien West	2.50	10	14	1	16:30:00	2021-11-10
2	2021-11-18	11:20:00	HTL Wien West	1.50	14	20	2	14:40:00	2021-11-17
3	2021-11-25	14:50:00	HTL Wien West	5.00	8	14	3	16:30:00	2021-11-24
100	2026-01-01	23:59:00	HTL TEST	49.99	10	25	1	00:00:00	2025-12-31
\.


--
-- Name: teilnehmer_teilnehmer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teilnehmer_teilnehmer_id_seq', 3, true);


--
-- Name: trainer_trainer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainer_trainer_id_seq', 1, false);


--
-- Name: trainings_trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainings_trainings_id_seq', 1, false);


--
-- Name: teilnehmer teilnehmer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teilnehmer
    ADD CONSTRAINT teilnehmer_pk PRIMARY KEY (teilnehmer_id);


--
-- Name: trainer trainer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_pk PRIMARY KEY (trainer_id);


--
-- Name: trainings trainings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_pk PRIMARY KEY (trainings_id);


--
-- Name: teilnehmer_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX teilnehmer_email_uindex ON public.teilnehmer USING btree (email);


--
-- Name: teilnehmer_teilnehmer_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX teilnehmer_teilnehmer_id_uindex ON public.teilnehmer USING btree (teilnehmer_id);


--
-- Name: trainer_trainer_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX trainer_trainer_id_uindex ON public.trainer USING btree (trainer_id);


--
-- Name: trainings_trainings_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX trainings_trainings_id_uindex ON public.trainings USING btree (trainings_id);


--
-- Name: teilnehmer_training teilnehmer___fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teilnehmer_training
    ADD CONSTRAINT teilnehmer___fk FOREIGN KEY (teilnehmer_id) REFERENCES public.teilnehmer(teilnehmer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: trainings trainer___fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainer___fk FOREIGN KEY (trainer_id) REFERENCES public.trainer(trainer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teilnehmer_training training___fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teilnehmer_training
    ADD CONSTRAINT training___fk FOREIGN KEY (trainings_id) REFERENCES public.trainings(trainings_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TABLE teilnehmer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teilnehmer TO simple2trainadmin;


--
-- Name: SEQUENCE teilnehmer_teilnehmer_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.teilnehmer_teilnehmer_id_seq TO simple2trainadmin;


--
-- Name: TABLE teilnehmer_training; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teilnehmer_training TO simple2trainadmin;


--
-- Name: TABLE trainer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.trainer TO simple2trainadmin;


--
-- Name: TABLE trainings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.trainings TO simple2trainadmin;


--
-- PostgreSQL database dump complete
--

