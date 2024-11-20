--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Homebrew)
-- Dumped by pg_dump version 16.4 (Homebrew)

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
-- Name: admins; Type: TABLE; Schema: public; Owner: paul
--

CREATE TABLE public.admins (
    id smallint NOT NULL,
    name character varying(15) NOT NULL,
    user_id smallint NOT NULL
);


ALTER TABLE public.admins OWNER TO paul;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE public.admins_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO paul;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: chefs; Type: TABLE; Schema: public; Owner: paul
--

CREATE TABLE public.chefs (
    id smallint NOT NULL,
    name character varying NOT NULL,
    user_id smallint NOT NULL
);


ALTER TABLE public.chefs OWNER TO paul;

--
-- Name: chefs_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE public.chefs_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chefs_id_seq OWNER TO paul;

--
-- Name: chefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE public.chefs_id_seq OWNED BY public.chefs.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: paul
--

CREATE TABLE public.customers (
    id smallint NOT NULL,
    name character varying(15) NOT NULL,
    user_id smallint NOT NULL
);


ALTER TABLE public.customers OWNER TO paul;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE public.customers_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO paul;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: foods; Type: TABLE; Schema: public; Owner: paul
--

CREATE TABLE public.foods (
    id smallint NOT NULL,
    name character varying(15) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.foods OWNER TO paul;

--
-- Name: foods_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE public.foods_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.foods_id_seq OWNER TO paul;

--
-- Name: foods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE public.foods_id_seq OWNED BY public.foods.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: paul
--

CREATE TABLE public.sessions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expired_at timestamp with time zone
);


ALTER TABLE public.sessions OWNER TO paul;

--
-- Name: users; Type: TABLE; Schema: public; Owner: paul
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(15) NOT NULL,
    password character varying(15) NOT NULL,
    role character varying(10) DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO paul;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paul
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO paul;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paul
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: chefs id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.chefs ALTER COLUMN id SET DEFAULT nextval('public.chefs_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: foods id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.foods ALTER COLUMN id SET DEFAULT nextval('public.foods_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY public.admins (id, name, user_id) FROM stdin;
1	super admin	1
\.


--
-- Data for Name: chefs; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY public.chefs (id, name, user_id) FROM stdin;
1	koki satu	2
2	koki dua	3
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY public.customers (id, name, user_id) FROM stdin;
1	customer satu	4
2	customer dua	5
\.


--
-- Data for Name: foods; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY public.foods (id, name, created_at, updated_at, deleted_at) FROM stdin;
1	masakan satu	2024-11-04 01:54:45.120963+07	\N	\N
2	masakan dua	2024-11-04 01:58:49.196884+07	\N	\N
3	masakan tiga	2024-11-04 02:01:28.288513+07	\N	\N
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY public.sessions (id, user_id, created_at, expired_at) FROM stdin;
74adae02-0a08-4c9c-8bf4-c0c515e6ffd9	2	2024-11-03 14:46:20.239981+07	\N
d064176b-76ef-46d1-aa88-ebc9a40d5b0f	2	2024-11-03 15:31:19.082388+07	\N
6b66cbf9-a1cd-4310-8e1d-efe40928a2ee	2	2024-11-03 15:28:25.579098+07	2024-11-03 15:31:56.274474+07
2eb2f766-ab94-457f-9380-e5d40bb9fb1d	4	2024-11-03 15:40:31.412329+07	\N
d80daedb-f526-49f0-891e-47ac6e2bb480	4	2024-11-04 00:20:31.196894+07	2024-11-04 02:08:02.215642+07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paul
--

COPY public.users (id, username, password, role, created_at, updated_at, deleted_at) FROM stdin;
1	x	x	admin	2024-11-01 11:53:45.388575+07	\N	\N
4	customer1	x	customer	2024-11-01 11:53:45.388575+07	\N	\N
5	customer2	x	customer	2024-11-01 11:53:45.388575+07	\N	\N
2	chef1	x	chef	2024-11-01 11:53:45.388575+07	\N	\N
3	chef2	x	chef	2024-11-01 11:53:45.388575+07	\N	\N
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: chefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('public.chefs_id_seq', 2, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('public.customers_id_seq', 2, true);


--
-- Name: foods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('public.foods_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paul
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: chefs chefs_pkey; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.chefs
    ADD CONSTRAINT chefs_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: foods foods_pkey; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: admins admins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paul
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

