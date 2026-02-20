--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character(3),
    visible_season character varying(20),
    star_id integer,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50),
    age_in_billions integer,
    galaxy_type character varying(100),
    distance_milky_ly numeric,
    visible_to_naked_eye boolean,
    is_a_dwarf boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    has_water boolean,
    orbit_period numeric,
    radius numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    has_water boolean,
    is_dwarf_planet boolean,
    length_of_year integer,
    mass numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    star_type text,
    age_in_billions integer,
    visible_to_naked_eye boolean,
    distance_from_earth numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Canis Major', 'CMa', 'Winter', 6, 'The Greater Dog, containing Sirius, the brightest star in the night sky.');
INSERT INTO public.constellation VALUES (2, 'Lyra', 'Lyr', 'Summer', 4, 'The Lyre, home to Kepler-186 and the bright star Vega.');
INSERT INTO public.constellation VALUES (3, 'Cygnus', 'Cyg', 'Summer', 5, 'The Swan, where the Kepler-452 system was discovered in the Milky Way arm.');
INSERT INTO public.constellation VALUES (4, 'Aquila', 'Aql', 'Summer', 3, 'The Eagle, representing the bird that carried Zeus’s thunderbolts.');
INSERT INTO public.constellation VALUES (5, 'Ursa Major', 'UMa', 'Year-round', 1, 'The Great Bear, one of the most recognizable constellations in the Northern Hemisphere.');
INSERT INTO public.constellation VALUES (6, 'Orion', 'Ori', 'Winter', NULL, 'The Hunter, one of the most famous constellations, containing the Orion Nebula.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Cygnus A', 'Cygnus', NULL, 'Elliptical Radio', 600000000, false, false);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 14, 'Barred Spiral', 0, true, false);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Dorado-Mensa', 10, 'Barred irregular/Dwarf irregular', 163000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Andromeda', 12, 'Barred Spiral', 2537000, true, false);
INSERT INTO public.galaxy VALUES (4, 'Maffei I', 'Cassiopeia', 10, 'Barred Spiral', 10000000, false, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Virgo', 13, 'Supergiant Elliptical', 53500000, false, false);
INSERT INTO public.galaxy VALUES (7, 'JADES-GS-z14-0', 'Fornax', 300, 'Lyman-break', 33800000000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, true, false, 27.32, 1737);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, false, 0.32, 11);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, false, 1.26, 6);
INSERT INTO public.moon VALUES (4, 'Amalthea', 3, false, false, 1.0, 100);
INSERT INTO public.moon VALUES (5, 'Callisto', 3, true, true, 1.0, 100);
INSERT INTO public.moon VALUES (6, 'Europa', 3, true, true, 3.55, 100);
INSERT INTO public.moon VALUES (7, 'Ganymede', 3, true, true, 1.0, 2634);
INSERT INTO public.moon VALUES (8, 'Tethys', 4, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (9, 'Dione', 4, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (10, 'Rhea', 4, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (11, 'Hyperion', 4, false, false, 1.0, 100);
INSERT INTO public.moon VALUES (12, 'Titan', 4, true, true, 15.95, 2575);
INSERT INTO public.moon VALUES (13, 'Phoebe', 4, false, false, 1.0, 100);
INSERT INTO public.moon VALUES (14, 'Ariel', 5, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (15, 'Miranda', 5, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (16, 'Oberon', 5, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (17, 'Titania', 5, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (18, 'Nereid', 6, false, false, 1.0, 100);
INSERT INTO public.moon VALUES (19, 'Triton', 6, true, false, 1.0, 100);
INSERT INTO public.moon VALUES (20, 'Charon', 7, true, false, 6.39, 606);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, false, 88, 0.33);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, false, 225, 4.87);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, false, 365, 5.97);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, false, 687, 0.64);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, false, 4331, 1898.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, false, 10747, 568.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, false, 30589, 86.80);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, false, 59800, 102.00);
INSERT INTO public.planet VALUES (9, 'CoRoT-7b', 2, false, false, 1, 4.80);
INSERT INTO public.planet VALUES (10, 'Gliese581', 3, false, false, 5, 15.60);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 4, true, false, 130, 1.50);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 5, true, false, 385, 5.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type Main Sequence', 5, true, 0.00001581);
INSERT INTO public.star VALUES (2, 'CoRoT-7', 1, 'G-type Main Sequence', 2, false, 489);
INSERT INTO public.star VALUES (3, 'Gliese 581', 1, 'Red Dwarf', 8, false, 20.4);
INSERT INTO public.star VALUES (4, 'Kepler-186', 1, 'Red Dwarf', 4, false, 582);
INSERT INTO public.star VALUES (5, 'Kepler-452', 1, 'G-type Main Sequence', 6, false, 1402);
INSERT INTO public.star VALUES (6, 'Sirius', 1, 'A-type Main Sequence', 0, true, 8.6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key1 UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_main_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_main_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

