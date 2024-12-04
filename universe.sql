--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_stars integer,
    large numeric,
    situation character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    large numeric,
    situation character varying(30) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_juntion; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_juntion (
    moon_juntion_id integer NOT NULL,
    holes integer,
    selenites integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.moon_juntion OWNER TO freecodecamp;

--
-- Name: moon_juntion_moon_juntion_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_juntion_moon_juntion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_juntion_moon_juntion_id_seq OWNER TO freecodecamp;

--
-- Name: moon_juntion_moon_juntion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_juntion_moon_juntion_id_seq OWNED BY public.moon_juntion.moon_juntion_id;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    long numeric,
    description text NOT NULL,
    has_clouds boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moons integer NOT NULL,
    is_red_star boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_juntion moon_juntion_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_juntion ALTER COLUMN moon_juntion_id SET DEFAULT nextval('public.moon_juntion_moon_juntion_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda I', 500, NULL, 'Really far...');
INSERT INTO public.galaxy VALUES (2, 'Andromeda II', 350, NULL, 'Really far...');
INSERT INTO public.galaxy VALUES (3, 'Andromeda III', 250, NULL, 'Really far...');
INSERT INTO public.galaxy VALUES (4, 'Andromeda IV', 140, NULL, 'Really far...');
INSERT INTO public.galaxy VALUES (5, 'Andromeda V', 258, NULL, 'Really far...');
INSERT INTO public.galaxy VALUES (6, 'Andromeda VII', 369, NULL, 'Really far...');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 2, NULL, 'So far...');
INSERT INTO public.moon VALUES (2, 'Moon 1', 2, NULL, 'So far...');
INSERT INTO public.moon VALUES (3, 'Moon 1', 2, NULL, 'So far...');
INSERT INTO public.moon VALUES (4, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (5, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (6, 'Moon 1', 4, NULL, 'So far...');
INSERT INTO public.moon VALUES (7, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (8, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (9, 'Moon 1', 4, NULL, 'So far...');
INSERT INTO public.moon VALUES (10, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (11, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (12, 'Moon 1', 4, NULL, 'So far...');
INSERT INTO public.moon VALUES (13, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (14, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (15, 'Moon 1', 4, NULL, 'So far...');
INSERT INTO public.moon VALUES (16, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (17, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (18, 'Moon 1', 4, NULL, 'So far...');
INSERT INTO public.moon VALUES (19, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (20, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (21, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (22, 'Moon 1', 4, NULL, 'So far...');
INSERT INTO public.moon VALUES (23, 'Moon 1', 10, NULL, 'So far...');
INSERT INTO public.moon VALUES (24, 'Moon 1', 3, NULL, 'So far...');
INSERT INTO public.moon VALUES (25, 'Moon 1', 4, NULL, 'So far...');


--
-- Data for Name: moon_juntion; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_juntion VALUES (1, 45000, 2, 'Moon 2');
INSERT INTO public.moon_juntion VALUES (2, 85241789, 84, 'Moon 2');
INSERT INTO public.moon_juntion VALUES (3, 145678963, 123456, 'Moon 2');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Planet 1', 25.36598, 'Lonely planet', false, 1);
INSERT INTO public.planet VALUES (3, 'Planet 2', 45.47841, 'Another lonely planet', false, 3);
INSERT INTO public.planet VALUES (4, 'Planet 3', 45.47841, 'Another lonely planet', false, 5);
INSERT INTO public.planet VALUES (5, 'Planet 4', 125.3694, 'Cartoon civilization', false, 5);
INSERT INTO public.planet VALUES (6, 'Planet 5', 14.2589, 'Star Wars', false, 4);
INSERT INTO public.planet VALUES (7, 'Planet 6', 14.2589, 'Green Lantern planet', false, 5);
INSERT INTO public.planet VALUES (8, 'Planet 7', 52.3698, 'Vision planet', true, 3);
INSERT INTO public.planet VALUES (9, 'Planet 8', 147.2589, 'Lonely planet', false, 1);
INSERT INTO public.planet VALUES (10, 'Planet 9', 147.2589, 'Lonely planet', false, 3);
INSERT INTO public.planet VALUES (11, 'Planet 10', 147.2589, 'Lonely planet', true, 6);
INSERT INTO public.planet VALUES (12, 'Planet 10', 147.2589, 'Lonely planet', true, 6);
INSERT INTO public.planet VALUES (13, 'Planet 10', 147.2589, 'Lonely planet', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Canis Majoris', 0, true, 1);
INSERT INTO public.star VALUES (2, 'Star 1', 25, false, 3);
INSERT INTO public.star VALUES (3, 'Star 2', 14, false, 6);
INSERT INTO public.star VALUES (4, 'Star 3', 0, true, 4);
INSERT INTO public.star VALUES (5, 'Star 4', 1478, true, 2);
INSERT INTO public.star VALUES (6, 'Star 5', 45, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_juntion_moon_juntion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_juntion_moon_juntion_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_juntion moon_juntion_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_juntion
    ADD CONSTRAINT moon_juntion_pkey PRIMARY KEY (moon_juntion_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy un_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT un_galaxy UNIQUE (galaxy_id);


--
-- Name: moon un_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT un_moon UNIQUE (moon_id);


--
-- Name: planet un_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT un_planet UNIQUE (planet_id);


--
-- Name: moon_juntion un_selenites; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_juntion
    ADD CONSTRAINT un_selenites UNIQUE (moon_juntion_id);


--
-- Name: star un_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT un_star UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

