--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-1.pgdg16.04+1)
-- Dumped by pg_dump version 12.3

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

--
-- Name: df9k3hectr2fe6; Type: DATABASE; Schema: -; Owner: yxgtrenpqxeffu
--

CREATE DATABASE df9k3hectr2fe6 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE df9k3hectr2fe6 OWNER TO yxgtrenpqxeffu;

\connect df9k3hectr2fe6

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.blog_post (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    content text NOT NULL,
    date_posted timestamp with time zone NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.blog_post OWNER TO yxgtrenpqxeffu;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO yxgtrenpqxeffu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO yxgtrenpqxeffu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO yxgtrenpqxeffu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO yxgtrenpqxeffu;

--
-- Name: files; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.files (
    sensor_id integer NOT NULL,
    file_name character varying(200)
);


ALTER TABLE public.files OWNER TO yxgtrenpqxeffu;

--
-- Name: inlet_switcher_state; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.inlet_switcher_state (
    "Datetime" timestamp with time zone NOT NULL,
    inlet_selected integer,
    inlet_1_state character varying(4),
    inlet_2_state character varying(4),
    inlet_name character varying(15)
);


ALTER TABLE public.inlet_switcher_state OWNER TO yxgtrenpqxeffu;

--
-- Name: primary_variables; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.primary_variables (
    id integer NOT NULL,
    "Variable Name" character varying(50),
    "Parameter Unit" character varying(50),
    "Housekeeping" boolean,
    "Available" boolean,
    "Sensor id" integer
);


ALTER TABLE public.primary_variables OWNER TO yxgtrenpqxeffu;

--
-- Name: primary_variables_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.primary_variables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.primary_variables_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: primary_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.primary_variables_id_seq OWNED BY public.primary_variables.id;


--
-- Name: process; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.process (
    id integer NOT NULL,
    name character varying(50),
    status character varying(50),
    "Sensor id" integer
);


ALTER TABLE public.process OWNER TO yxgtrenpqxeffu;

--
-- Name: process_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.process_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.process_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.process_id_seq OWNED BY public.process.id;


--
-- Name: sensor; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor (
    id integer NOT NULL,
    name character varying(50),
    acronym character varying(50),
    "data table" character varying(50),
    available boolean,
    "Process" character varying(50)
);


ALTER TABLE public.sensor OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_ccn; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_ccn (
    "Datetime" timestamp with time zone NOT NULL,
    "Super Saturation" double precision,
    "Column Temperature Stabilized" double precision,
    "Delta T" double precision,
    "T1 Set" double precision,
    "T1 Read" double precision,
    "T2 Set" double precision,
    "T2 Read" double precision,
    "T3 Set" double precision,
    "T3 Read" double precision,
    "Naftion Set" double precision,
    "T Naftion" double precision,
    "Inlet Set" double precision,
    "T Inlet" double precision,
    "OCP Set" double precision,
    "T OCP" double precision,
    "T Sample" double precision,
    "Sample Flow Rate" double precision,
    "Sheath Flow Rate" double precision,
    "Sample Pressure" double precision,
    "Laser Current" double precision,
    "Overflow" double precision,
    "Baseline Monitor" double precision,
    "First Stage Monitor" double precision,
    "Bin" double precision,
    "Bin 1" double precision,
    "Bin 2" double precision,
    "Bin 3" double precision,
    "Bin 4" double precision,
    "Bin 5" double precision,
    "Bin 6" double precision,
    "Bin 7" double precision,
    "Bin 8" double precision,
    "Bin 9" double precision,
    "Bin 10" double precision,
    "Bin 11" double precision,
    "Bin 12" double precision,
    "Bin 13" double precision,
    "Bin 14" double precision,
    "Bin 15" double precision,
    "Bin 16" double precision,
    "Bin 17" double precision,
    "Bin 18" double precision,
    "Bin 19" double precision,
    "Bin 20" double precision,
    "Number Concentration" double precision,
    "Valve Set" double precision,
    "Alarm Code" double precision,
    "Alarm Sum" double precision,
    "CMD" double precision,
    "GMD" double precision
);


ALTER TABLE public.sensor_ccn OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_cpd3_clap; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_cpd3_clap (
    "Datetime" timestamp with time zone NOT NULL,
    "Transmittance" double precision,
    "Aerosol light absorption coefficient" double precision,
    "Transmittance B" double precision
);


ALTER TABLE public.sensor_cpd3_clap OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_cpd3_cpc; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_cpd3_cpc (
    "Datetime" timestamp with time zone NOT NULL,
    "Condensation nuclei concentration" double precision
);


ALTER TABLE public.sensor_cpd3_cpc OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_cpd3_neph; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_cpd3_neph (
    "Datetime" timestamp with time zone NOT NULL,
    "Aerosol light scattering coefficient" double precision
);


ALTER TABLE public.sensor_cpd3_neph OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_cpd3_pwd_vaisala; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_cpd3_pwd_vaisala (
    "Datetime" timestamp with time zone NOT NULL,
    "Ambient Temperature" double precision,
    "Precipitation Rate" double precision,
    "Present Weather Flag" double precision,
    "Present Weather Code" double precision,
    "Visibility Distance" double precision
);


ALTER TABLE public.sensor_cpd3_pwd_vaisala OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_cpd3_wmt_vaisala; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_cpd3_wmt_vaisala (
    "Datetime" timestamp with time zone NOT NULL,
    "Wind Direction" double precision,
    "Wind Speed" double precision
);


ALTER TABLE public.sensor_cpd3_wmt_vaisala OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_cpd3_wxt_vaisala; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_cpd3_wxt_vaisala (
    "Datetime" timestamp with time zone NOT NULL,
    "Ambient Pressure" double precision,
    "Ambient Temperature" double precision,
    "Ambient Relative Humidity" double precision,
    "Solar Radiation" double precision,
    "Wind Direction" double precision,
    "Precipitation Rate" double precision,
    "Wind Speed" double precision,
    "Wind Gust Speed" double precision
);


ALTER TABLE public.sensor_cpd3_wxt_vaisala OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_dma; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_dma (
    "Datetime" timestamp with time zone NOT NULL,
    "Start Datetime" timestamp with time zone NOT NULL,
    "End Datetime" timestamp with time zone NOT NULL,
    "Scan Direction" integer,
    "Sheath Sample Pressure" integer,
    "Sheath Temp" double precision,
    "Sheath Average" double precision,
    "Sheath Standard Deviation" double precision,
    "Sheath RH" integer,
    colsamp_avg double precision,
    colsamp_sdec double precision,
    colsame_rh integer,
    colsamp_temp double precision,
    "CPC A Flow Average" double precision,
    "CPC A Standard Deviation" double precision,
    sat_temp double precision,
    cond_temp double precision,
    "SEMS Errors" double precision,
    "MCPC Errors" double precision,
    "Impactor Press" double precision,
    "Bin Diameter 1" double precision,
    "Bin Diameter 2" double precision,
    "Bin Diameter 3" double precision,
    "Bin Diameter 4" double precision,
    "Bin Diameter 5" double precision,
    "Bin Diameter 6" double precision,
    "Bin Diameter 7" double precision,
    "Bin Diameter 8" double precision,
    "Bin Diameter 9" double precision,
    "Bin Diameter 10" double precision,
    "Bin Diameter 11" double precision,
    "Bin Diameter 12" double precision,
    "Bin Diameter 13" double precision,
    "Bin Diameter 14" double precision,
    "Bin Diameter 15" double precision,
    "Bin Diameter 16" double precision,
    "Bin Diameter 17" double precision,
    "Bin Diameter 18" double precision,
    "Bin Diameter 19" double precision,
    "Bin Diameter 20" double precision,
    "Bin Diameter 21" double precision,
    "Bin Diameter 22" double precision,
    "Bin Diameter 23" double precision,
    "Bin Diameter 24" double precision,
    "Bin Diameter 25" double precision,
    "Bin Diameter 26" double precision,
    "Bin Diameter 27" double precision,
    "Bin Diameter 28" double precision,
    "Bin Diameter 29" double precision,
    "Bin Diameter 30" double precision,
    "Bin Diameter 31" double precision,
    "Bin Diameter 32" double precision,
    "Bin Diameter 33" double precision,
    "Bin Diameter 34" double precision,
    "Bin Diameter 35" double precision,
    "Bin Diameter 36" double precision,
    "Bin Diameter 37" double precision,
    "Bin Diameter 38" double precision,
    "Bin Diameter 39" double precision,
    "Bin Diameter 40" double precision,
    "Bin Diameter 41" double precision,
    "Bin Diameter 42" double precision,
    "Bin Diameter 43" double precision,
    "Bin Diameter 44" double precision,
    "Bin Diameter 45" double precision,
    "Bin Diameter 46" double precision,
    "Bin Diameter 47" double precision,
    "Bin Diameter 48" double precision,
    "Bin Diameter 49" double precision,
    "Bin Diameter 50" double precision,
    "Bin Diameter 51" double precision,
    "Bin Diameter 52" double precision,
    "Bin Diameter 53" double precision,
    "Bin Diameter 54" double precision,
    "Bin Diameter 55" double precision,
    "Bin Diameter 56" double precision,
    "Bin Diameter 57" double precision,
    "Bin Diameter 58" double precision,
    "Bin Diameter 59" double precision,
    "Bin Diameter 60" double precision,
    "Bin Constant 1" double precision,
    "Bin Constant 2" double precision,
    "Bin Constant 3" double precision,
    "Bin Constant 4" double precision,
    "Bin Constant 5" double precision,
    "Bin Constant 6" double precision,
    "Bin Constant 7" double precision,
    "Bin Constant 8" double precision,
    "Bin Constant 9" double precision,
    "Bin Constant 10" double precision,
    "Bin Constant 11" double precision,
    "Bin Constant 12" double precision,
    "Bin Constant 13" double precision,
    "Bin Constant 14" double precision,
    "Bin Constant 15" double precision,
    "Bin Constant 16" double precision,
    "Bin Constant 17" double precision,
    "Bin Constant 18" double precision,
    "Bin Constant 19" double precision,
    "Bin Constant 20" double precision,
    "Bin Constant 21" double precision,
    "Bin Constant 22" double precision,
    "Bin Constant 23" double precision,
    "Bin Constant 24" double precision,
    "Bin Constant 25" double precision,
    "Bin Constant 26" double precision,
    "Bin Constant 27" double precision,
    "Bin Constant 28" double precision,
    "Bin Constant 29" double precision,
    "Bin Constant 30" double precision,
    "Bin Constant 31" double precision,
    "Bin Constant 32" double precision,
    "Bin Constant 33" double precision,
    "Bin Constant 34" double precision,
    "Bin Constant 35" double precision,
    "Bin Constant 36" double precision,
    "Bin Constant 37" double precision,
    "Bin Constant 38" double precision,
    "Bin Constant 39" double precision,
    "Bin Constant 40" double precision,
    "Bin Constant 41" double precision,
    "Bin Constant 42" double precision,
    "Bin Constant 43" double precision,
    "Bin Constant 44" double precision,
    "Bin Constant 45" double precision,
    "Bin Constant 46" double precision,
    "Bin Constant 47" double precision,
    "Bin Constant 48" double precision,
    "Bin Constant 49" double precision,
    "Bin Constant 50" double precision,
    "Bin Constant 51" double precision,
    "Bin Constant 52" double precision,
    "Bin Constant 53" double precision,
    "Bin Constant 54" double precision,
    "Bin Constant 55" double precision,
    "Bin Constant 56" double precision,
    "Bin Constant 57" double precision,
    "Bin Constant 58" double precision,
    "Bin Constant 59" double precision,
    "Bin Constant 60" double precision
);


ALTER TABLE public.sensor_dma OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_hygrometer; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_hygrometer (
    "Datetime" timestamp with time zone NOT NULL,
    "Water Vapor Content" double precision,
    "Water Vapor Pressure" double precision,
    "Water Vapor Temperature" double precision
);


ALTER TABLE public.sensor_hygrometer OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensor_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.sensor_id_seq OWNED BY public.sensor.id;


--
-- Name: sensor_log; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_log (
    id integer NOT NULL,
    datetime timestamp with time zone,
    log_type character varying(15),
    log character varying(300),
    "Sensor id" integer
);


ALTER TABLE public.sensor_log OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_log_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.sensor_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensor_log_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: sensor_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.sensor_log_id_seq OWNED BY public.sensor_log.id;


--
-- Name: sensor_uv_lif; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.sensor_uv_lif (
    "Datetime" timestamp with time zone NOT NULL,
    "408 Board Temperature" double precision,
    bandwidths_0 double precision,
    bandwidths_1 double precision,
    bandwidths_2 double precision,
    bandwidths_3 double precision,
    baseline_0 double precision,
    baseline_1 double precision,
    baseline_2 double precision,
    baseline_3 double precision,
    clump_count double precision,
    "Exited Particles Count[#/cm3]" double precision,
    "Total Particle Count [all][#/cm3]" double precision,
    h12310_temperature double precision,
    max_transit_time_counts double precision,
    min_transit_time_counts double precision,
    missed_particle_count double precision,
    num_discarted_particles double precision,
    num_oversize_rejects double precision,
    "Relative Humidity" double precision,
    "System Power" double precision,
    "Sample Mass Flow Rate [L/min]" double precision,
    "Sample Pressure" double precision,
    "Sample Flow Rate Set Point" double precision,
    "Sample Temperature" double precision,
    "Sample Flow Rate" double precision,
    "Sheath Sample Mass Flow[L/min]" double precision,
    "Sheath Sample Pressure" double precision,
    "Sheath Sample Flow Rate Set Point" double precision,
    "Sheath Sample Temperature" double precision,
    "Sheath Flow Rate" double precision,
    sizer_oversize_count double precision,
    temperature double precision,
    total_particle_count double precision,
    total_trigger_count double precision,
    valid_particle_count double precision,
    xe1_power double precision,
    xe2_power double precision,
    "Asphericity" double precision,
    density_gcm3 double precision,
    ep_overflow_flag double precision,
    flag_excited double precision,
    mass_ug double precision,
    nf_shape_0 double precision,
    nf_shape_1 double precision,
    nf_shape_2 double precision,
    nf_shape_3 double precision,
    nf_sizer_relative_peak double precision,
    nf_sizer_transit_time_nsec double precision,
    "Size of Particle[um]" double precision,
    "Xe1-A Fluorescence Peak" double precision,
    "Xe1-B Fluorescence Peak" double precision,
    "Xe2-A Fluorescence Peak" double precision,
    "Xe2-B Fluorescence Peak" double precision
);


ALTER TABLE public.sensor_uv_lif OWNER TO yxgtrenpqxeffu;

--
-- Name: users_log; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.users_log (
    id integer NOT NULL,
    "Datetime" timestamp with time zone NOT NULL,
    log_type text NOT NULL,
    "Log" text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_log OWNER TO yxgtrenpqxeffu;

--
-- Name: users_log_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.users_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_log_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: users_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.users_log_id_seq OWNED BY public.users_log.id;


--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE TABLE public.users_profile (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_profile OWNER TO yxgtrenpqxeffu;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE SEQUENCE public.users_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_id_seq OWNER TO yxgtrenpqxeffu;

--
-- Name: users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER SEQUENCE public.users_profile_id_seq OWNED BY public.users_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: primary_variables id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.primary_variables ALTER COLUMN id SET DEFAULT nextval('public.primary_variables_id_seq'::regclass);


--
-- Name: process id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.process ALTER COLUMN id SET DEFAULT nextval('public.process_id_seq'::regclass);


--
-- Name: sensor id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor ALTER COLUMN id SET DEFAULT nextval('public.sensor_id_seq'::regclass);


--
-- Name: sensor_log id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_log ALTER COLUMN id SET DEFAULT nextval('public.sensor_log_id_seq'::regclass);


--
-- Name: users_log id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_log ALTER COLUMN id SET DEFAULT nextval('public.users_log_id_seq'::regclass);


--
-- Name: users_profile id; Type: DEFAULT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN id SET DEFAULT nextval('public.users_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add post	1	add_post
2	Can change post	1	change_post
3	Can delete post	1	delete_post
4	Can view post	1	view_post
5	Can add profile	2	add_profile
6	Can change profile	2	change_profile
7	Can delete profile	2	delete_profile
8	Can view profile	2	view_profile
9	Can add log	3	add_log
10	Can change log	3	change_log
11	Can delete log	3	delete_log
12	Can view log	3	view_log
13	Can add inlet_ switcher_ state	4	add_inlet_switcher_state
14	Can change inlet_ switcher_ state	4	change_inlet_switcher_state
15	Can delete inlet_ switcher_ state	4	delete_inlet_switcher_state
16	Can view inlet_ switcher_ state	4	view_inlet_switcher_state
17	Can add sensor	5	add_sensor
18	Can change sensor	5	change_sensor
19	Can delete sensor	5	delete_sensor
20	Can view sensor	5	view_sensor
21	Can add file	6	add_file
22	Can change file	6	change_file
23	Can delete file	6	delete_file
24	Can view file	6	view_file
25	Can add process	7	add_process
26	Can change process	7	change_process
27	Can delete process	7	delete_process
28	Can view process	7	view_process
29	Can add Variable	8	add_primary_variables
30	Can change Variable	8	change_primary_variables
31	Can delete Variable	8	delete_primary_variables
32	Can view Variable	8	view_primary_variables
33	Can add log	9	add_log
34	Can change log	9	change_log
35	Can delete log	9	delete_log
36	Can view log	9	view_log
37	Can add ccn	10	add_ccn
38	Can change ccn	10	change_ccn
39	Can delete ccn	10	delete_ccn
40	Can view ccn	10	view_ccn
41	Can add clap	11	add_clap
42	Can change clap	11	change_clap
43	Can delete clap	11	delete_clap
44	Can view clap	11	view_clap
45	Can add hygrometer	12	add_hygrometer
46	Can change hygrometer	12	change_hygrometer
47	Can delete hygrometer	12	delete_hygrometer
48	Can view hygrometer	12	view_hygrometer
49	Can add uv_ lif	13	add_uv_lif
50	Can change uv_ lif	13	change_uv_lif
51	Can delete uv_ lif	13	delete_uv_lif
52	Can view uv_ lif	13	view_uv_lif
53	Can add dma	14	add_dma
54	Can change dma	14	change_dma
55	Can delete dma	14	delete_dma
56	Can view dma	14	view_dma
57	Can add log entry	15	add_logentry
58	Can change log entry	15	change_logentry
59	Can delete log entry	15	delete_logentry
60	Can view log entry	15	view_logentry
61	Can add permission	16	add_permission
62	Can change permission	16	change_permission
63	Can delete permission	16	delete_permission
64	Can view permission	16	view_permission
65	Can add group	17	add_group
66	Can change group	17	change_group
67	Can delete group	17	delete_group
68	Can view group	17	view_group
69	Can add user	18	add_user
70	Can change user	18	change_user
71	Can delete user	18	delete_user
72	Can view user	18	view_user
73	Can add content type	19	add_contenttype
74	Can change content type	19	change_contenttype
75	Can delete content type	19	delete_contenttype
76	Can view content type	19	view_contenttype
77	Can add session	20	add_session
78	Can change session	20	change_session
79	Can delete session	20	delete_session
80	Can view session	20	view_session
81	Can add sensor cpd3 clap	21	add_sensorcpd3clap
82	Can change sensor cpd3 clap	21	change_sensorcpd3clap
83	Can delete sensor cpd3 clap	21	delete_sensorcpd3clap
84	Can view sensor cpd3 clap	21	view_sensorcpd3clap
85	Can add sensor cpd3 cpc	22	add_sensorcpd3cpc
86	Can change sensor cpd3 cpc	22	change_sensorcpd3cpc
87	Can delete sensor cpd3 cpc	22	delete_sensorcpd3cpc
88	Can view sensor cpd3 cpc	22	view_sensorcpd3cpc
89	Can add sensor cpd3 neph	23	add_sensorcpd3neph
90	Can change sensor cpd3 neph	23	change_sensorcpd3neph
91	Can delete sensor cpd3 neph	23	delete_sensorcpd3neph
92	Can view sensor cpd3 neph	23	view_sensorcpd3neph
93	Can add sensor cpd3 pwd vaisala	24	add_sensorcpd3pwdvaisala
94	Can change sensor cpd3 pwd vaisala	24	change_sensorcpd3pwdvaisala
95	Can delete sensor cpd3 pwd vaisala	24	delete_sensorcpd3pwdvaisala
96	Can view sensor cpd3 pwd vaisala	24	view_sensorcpd3pwdvaisala
97	Can add sensor cpd3 wmt vaisala	25	add_sensorcpd3wmtvaisala
98	Can change sensor cpd3 wmt vaisala	25	change_sensorcpd3wmtvaisala
99	Can delete sensor cpd3 wmt vaisala	25	delete_sensorcpd3wmtvaisala
100	Can view sensor cpd3 wmt vaisala	25	view_sensorcpd3wmtvaisala
101	Can add sensor cpd3 wxt vaisala	26	add_sensorcpd3wxtvaisala
102	Can change sensor cpd3 wxt vaisala	26	change_sensorcpd3wxtvaisala
103	Can delete sensor cpd3 wxt vaisala	26	delete_sensorcpd3wxtvaisala
104	Can view sensor cpd3 wxt vaisala	26	view_sensorcpd3wxtvaisala
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$ETASoxemyJGA$+5HSWZlhUdeTur2VCCqZgtqo7caAgYO8uonfzat8AUE=	2020-12-02 17:27:47.073978+00	t	naxsor			lemanuel.colon@upr.edu	t	t	2020-11-07 04:33:22.169863+00
2	pbkdf2_sha256$216000$tihL4wBYSp6n$9JbskvubblBT/PlLu6UnPuAKMnHoYyapbaO2GLK/fQE=	2020-12-01 15:48:24.994692+00	t	acas_admin			adapts_admin@upr.edu	t	t	2020-11-09 18:21:12+00
4	pbkdf2_sha256$216000$WcSUOllRy59J$R7U7B9QJUekQ4AW9YrnvKzXs/yoWc9I/f10+pSdD7V4=	2020-11-21 01:51:12.875468+00	f	edrick			edrick@chino.edu	f	t	2020-11-21 01:51:01.133581+00
3	pbkdf2_sha256$216000$6cDHmyvDWjYR$rUtP9GneFm6UGsQ1FveWjLcoqd3ss9MOqi8xUv7akxA=	2020-11-09 21:02:49.298705+00	f	DarrelBaumgardner			darrel.baumgardner@gmail.com	f	t	2020-11-09 21:02:40.798421+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.blog_post (id, title, content, date_posted, author_id) FROM stdin;
1	Test	Test content	2020-11-07 04:44:45.734103+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-11-09 18:21:39.626152+00	2	acas_admin	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	18	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	blog	post
2	users	profile
3	users	log
4	sensors	inlet_switcher_state
5	sensors	sensor
6	sensors	file
7	sensors	process
8	sensors	primary_variables
9	sensors	log
10	sensors	ccn
11	sensors	clap
12	sensors	hygrometer
13	sensors	uv_lif
14	sensors	dma
15	admin	logentry
16	auth	permission
17	auth	group
18	auth	user
19	contenttypes	contenttype
20	sessions	session
21	sensors	sensorcpd3clap
22	sensors	sensorcpd3cpc
23	sensors	sensorcpd3neph
24	sensors	sensorcpd3pwdvaisala
25	sensors	sensorcpd3wmtvaisala
26	sensors	sensorcpd3wxtvaisala
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-11-07 04:32:14.802529+00
2	auth	0001_initial	2020-11-07 04:32:15.99395+00
3	admin	0001_initial	2020-11-07 04:32:18.311508+00
4	admin	0002_logentry_remove_auto_add	2020-11-07 04:32:18.581252+00
5	admin	0003_logentry_add_action_flag_choices	2020-11-07 04:32:18.600022+00
6	contenttypes	0002_remove_content_type_name	2020-11-07 04:32:18.771041+00
7	auth	0002_alter_permission_name_max_length	2020-11-07 04:32:18.788724+00
8	auth	0003_alter_user_email_max_length	2020-11-07 04:32:18.812358+00
9	auth	0004_alter_user_username_opts	2020-11-07 04:32:18.832619+00
10	auth	0005_alter_user_last_login_null	2020-11-07 04:32:18.852614+00
11	auth	0006_require_contenttypes_0002	2020-11-07 04:32:18.858201+00
12	auth	0007_alter_validators_add_error_messages	2020-11-07 04:32:18.874741+00
13	auth	0008_alter_user_username_max_length	2020-11-07 04:32:19.659786+00
14	auth	0009_alter_user_last_name_max_length	2020-11-07 04:32:19.676877+00
15	auth	0010_alter_group_name_max_length	2020-11-07 04:32:19.695773+00
16	auth	0011_update_proxy_permissions	2020-11-07 04:32:19.714925+00
17	auth	0012_alter_user_first_name_max_length	2020-11-07 04:32:19.730332+00
18	blog	0001_initial	2020-11-07 04:32:20.110028+00
22	sessions	0001_initial	2020-11-07 04:32:24.223618+00
23	users	0001_initial	2020-11-07 04:32:24.826839+00
24	users	0002_log	2020-11-07 04:32:25.121379+00
25	users	0003_auto_20201105_0040	2020-11-07 04:32:25.295719+00
38	sensors	0001_initial	2020-11-23 16:36:20.155305+00
39	sensors	0002_ccn_clap_dma_hygrometer_uv_lif	2020-11-23 16:36:20.655689+00
40	sensors	0003_auto_20201105_0040	2020-11-23 16:36:20.763216+00
41	sensors	0004_sensorcpd3clap_sensorcpd3cpc_sensorcpd3neph_sensorcpd3pwdvaisala_sensorcpd3wmtvaisala_sensorcpd3wxtv	2020-11-23 16:36:21.02638+00
42	sensors	0005_auto_20201123_1207	2020-11-23 16:40:10.975173+00
43	sensors	0006_auto_20201123_1307	2020-11-23 17:09:50.161802+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0rrfzzqhkeukkqyr9sz9o3jssk79uelo	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kepcd:WHye1qAhSZrE9IyYeah5rsReqvV9ZXl23-mNuj7RdtQ	2020-12-01 01:17:27.917651+00
q2ciecnu9ids3fui4169s3lyq8aoi2o6	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kepp0:5MERZU9ITSAyxPy-CI0QApNwxwRdocWJjFfoHo07_TY	2020-12-01 01:30:14.264054+00
knpk9gzahavtf7nkix007efd1b492f7z	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1keq8V:iYAW9SaebcxJ_Jhn9MXUlpv7sIAzkRmX39zcHm3ye7k	2020-12-01 01:50:23.127221+00
gkvkg7irwsmbzm5o2s6xpk1tq4v51wvq	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1keqOx:Fnpi2FPgTabyzaBdal1zcZB_s9w9HniprflRWJOTOxA	2020-12-01 02:07:23.227902+00
urt9qpswq3ggq0qa7yfdpcpyr0ve4wdg	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbeje:8bcREu78zCx2FtQnuztV3gFXiRv-COO1glLLACH08NI	2020-11-22 07:03:34.644076+00
jdy6pbi48d5zjmwmkk5596utkscb3bgh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbepS:9MpeEStBpdAnrpM0ZNYnGi8ijL_3XbQFuhMzqpkIrLQ	2020-11-22 07:09:34.645748+00
iavrwybu9mqemyj9dzm042mzed6230iz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbetZ:X0Mc1veHrsMqglBzoLMwEhdlPDcjE4KqOvQaO8ElZGI	2020-11-22 07:13:49.8398+00
9eqrgklv59qbktij9sw184j2oq69emuq	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbf0x:prvOR0XmYm5OkGL4bRVeYW6iOXmLVLyC3MaJBECRz3I	2020-11-22 07:21:27.6014+00
xrhcd57mfc793dwcske9nqk5lgp7pg95	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfBsO:1J9fjVHUONDUwBXi5t8DHFySWcYujn0B2IanOiGxAcg	2020-12-02 01:03:12.479373+00
kbnfuwnqllt9aybydlghqo7m9q1jyjzp	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbgwP:tPhfswYws0GwC5vynF5nT0hWvVaBWwzCRC_ojGTHHTY	2020-11-22 09:24:53.434123+00
fggthguh38v6kc9xqwb9gwzjxro0dgng	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfDMV:Kttjk_Siwa-iQwtcGpVIUMXetgcLuuqL1AO8-GQaklE	2020-12-02 02:38:23.393978+00
in33ud0mt8i3z3oro9noss40rwutcnk2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfDPX:BBnfw7BX4bcIX1vfpberjfQMjFHDziiIGyJ0v4NEolU	2020-12-02 02:41:31.536854+00
jsx4j5zzi5swe2ecpwf1m2r7d8hhailu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbtWt:jNlxpfpQu2xrbU6Mcbuv2Q_uJCmIFR3pp-lfscKVwUQ	2020-11-22 22:51:23.350505+00
cuebz4tok3thu54vtxpno3vbuo2udiea	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbtu8:gRd7xjHh6idEXvuKsnbF68CzzC-X0KBCjIII7WH2dcA	2020-11-22 23:15:24.314428+00
2km3baxchx6ud1apby32pq15yvar0t0p	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfDam:B808osKpskUbo09fCYxGmsW63asvUSYjpSXtiLHcgaA	2020-12-02 02:53:08.309368+00
84ypaieiz1h2mr9ub1zcmloguqy0ekgu	.eJxVjLsOAiEQAP-F2hBggUNLe7-B7C57cmoguUdl_HdzyRXazkzmrTJua83bInOeirooUKdfRshPabsoD2z3rrm3dZ5I74k-7KJvvcjrerR_g4pL3bcxGEaxAxO65K1J6NnGkAxCGCgKgZciwScbXIKCYGiEMXlgIj479fkC1Rs3vA:1kcEJN:4Ei43ZEYF4WQDElBfWyOCoNWaeFAvdRBGYrYI3RD3a8	2020-11-23 21:02:49.306156+00
prh4p2b7tzkxkvw0757l40c6770uymgf	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfEqe:phMdSKD4U1DKNrrAVMnZ0v1SW4C7BqXpsTE2gA7BNNA	2020-12-02 04:13:36.596496+00
hydkr4qxjabjpuozodyhcwi1bslbojz9	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfW0N:z9dJQmPN2qgf31IkT3Cb1AOdcaBX3UGWzk1KQ1bX0Ww	2020-12-02 22:32:47.567286+00
1mo502obsjgfujrz5lzxzxuleowjjm6x	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfWkx:4eUBKPRQEbqkPyl-DqUleg9qalB61ke-I2R5NwimESk	2020-12-02 23:20:55.441476+00
5ppxnyqtwosutfa9rppa3a660wvmxj7s	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfWqG:kaS4Deet4FGRi8JnA4bqTvGfjtdXTtvLXKwdyMi7zcE	2020-12-02 23:26:24.571083+00
i5wy07xaifnzkvcc1n7s227clluh2u9y	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfWza:OUM-I2WA5g5AiPK-bAj8POjf3f1iAc7MqbZoeK59YU0	2020-12-02 23:36:02.422435+00
wbzioaujorm8pyr6zc8t05i6op4ot2j2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfX2w:kpDLkhsQsyg-PWN6daBNyQZnaPQW5iCBvjtgk_oIWr0	2020-12-02 23:39:30.135332+00
2gq5sqrcak4s6rtn1dfzs1l88wof9foe	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfX7c:T8g7vuokWr9S2qb8qBvBAVYzv33Xjm5PlX1AwpLyEDA	2020-12-02 23:44:20.104913+00
u7vfrv429n3z56hnk6rnrr51i5ir3il4	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfXBj:dM9U7ckjhavc9SiXDcAxtDPpND8vklDRje0B4skAKjM	2020-12-02 23:48:35.234677+00
ub0fykh0p6lq1seerjiznrszq7tsunn7	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfXDQ:eVNIdftcU9_soussCZdZlAeUnAy0taT2b5Co8KokqcA	2020-12-02 23:50:20.381106+00
thx232udhl0kf7ouzdmziqnpq42f0j9p	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfXUu:CVve65tSXj_qdTf4iCid33mOO6e7hQ_xxuvqXSPeNq0	2020-12-03 00:08:24.512714+00
2ut3d3i81tgyjfwmho6g3guhqt8hk13z	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kepfq:dq2O2SCLQ8VCr1zAMOjHHWiHuHFLhsllAc30cU22dao	2020-12-01 01:20:46.187655+00
cr1p8dh1g3gvcyayuuh3b3yx9vjgrihl	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kepkw:WMO9xmZ4IFfe2UpCAn77SH3ePtVuT8hciqbjAJcdw6U	2020-12-01 01:26:02.244916+00
y45w0w3fco2pmogw367x2kjnvafq43f8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgdA8:nStHAtLh2CeBALFNsRHTn_p2rQRRFE42kA_yWqDYPXE	2020-12-06 00:23:28.835888+00
hvjsh2sixrfopl6idczsjsd07zcbp7pu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1keq44:W9sdCLX7kDS6-8EscdJxWXj3V5SMVyocMFXWCGdtFaw	2020-12-01 01:45:48.699916+00
gxvz14ow6blyo4r7dhvktr3yv1pxc2gn	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1keqBF:cuAl-y2uNcP-Bk3L_G5zAGGc6nW0oyzYOIPJrRv9yq0	2020-12-01 01:53:13.222365+00
xtd94chv2bspin2vlr4esit5cuv0u4ye	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1keqFH:P42tlD0ncvrLJebHO-mxfCIWzvTdJqYWJyymn1aUyR4	2020-12-01 01:57:23.516661+00
imbyohnyxy0i5859w93fe58np75u5izl	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbegz:Y3OFdxp760Y8Py3edGL7mznycW8yporBeM-me0hFgIQ	2020-11-22 07:00:49.560644+00
1tnl5o0gkib1qp1ezlvrqob3ujg5vwb4	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbelt:EUgNysO8XPsLsfbH_CAAsKcBLE5IH6p8DjVIYnw60AU	2020-11-22 07:05:53.261935+00
1izohd5o7i35lixwmkaurgr6v4ytd3b5	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1keqJN:71cJ_ZOlHEFzisJ26x6iBaQCaV0GFoEVcFoamFw94P0	2020-12-01 02:01:37.947236+00
0nci3xceo1xc25lppv6iftogcrzhqzmo	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbenY:HD61GJatj6gelb_P6K2jO3VVqVyTHtPcKN0aLwL-qiM	2020-11-22 07:07:36.785728+00
so3et9x5eqvi1mfp3nxdyjqrg8syl16i	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbesC:BZmPZ1VQ6SZn-jxD4ntHyarcc2qcKNpPmZIMOEj5-A8	2020-11-22 07:12:24.52537+00
lx9m2g8et7xcu2qjj2vosqyfehkm6ri7	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbew0:jQix7ubEXsA4IWz7bUQBU3W3xPBlbfYO5DDsirGiC7E	2020-11-22 07:16:20.866911+00
6m6bs795tx0fwj8hr302139eil38k3rn	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbexO:JKqhteiTL3y3bxLO_JMdUZ1Vlgo-sRDsGLEkNp8sXoM	2020-11-22 07:17:46.537273+00
nm38t37pjev8rado3mn5etrn10rql65m	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbfA1:KMOJ_gqJPP_AKNg5a3ej3t3F7HHp2Xeet4Kykrcp7E4	2020-11-22 07:30:49.261296+00
cn7ad3p7ali19qq7nhsk8m86eml11lgk	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfBmf:bWNT8xcPnihDpefNnSHchd_Msf3-USqTpJaNImtnmAE	2020-12-02 00:57:17.53233+00
z8t3zigqt52pg66j79evgahkvqx6i2w1	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfCxm:XHL0DnxVBSysEti6iLUxBsls0smMCsocjJ82Y1nVMA8	2020-12-02 02:12:50.376307+00
ewe5dy03niolpmz8x8x02k7pdo69jskt	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbgyt:WY38hdVJ6Jbz-Tek9Dlec_KFtP2TvvbhByRS4BEJtbc	2020-11-22 09:27:27.832524+00
xy6he6k146grbfd7gr2smsqs5szkoeo5	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfDXZ:Ne7L7numj5pSEshSGi0pf3fLCCk9uWSxQlzuaVm3sbM	2020-12-02 02:49:49.43606+00
f94bnprnz7l9bqewnv6gvxwx6z7sgc2r	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbgzA:REIpX8sw9JGE_X4Wi7O6fQJddJ6ZeWo6O3Ob_la8AO8	2020-11-22 09:27:44.112412+00
5ownyegtabhmiikouyu7mbspzov5a0he	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbto9:xgHIOJJyWNw7roRFAQffo2OIP92MpX97OtPDR_EQGRc	2020-11-22 23:09:13.63093+00
ji7utz7l351y4x0yshejw6d3ig4ls5y9	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfDif:Owx2UHgK2fIe9MB2rJNVPVkzTPTa4oWZq_JSzKGUGd0	2020-12-02 03:01:17.640507+00
zihkd5632vu00x7il6bu30u0ah8tdu7a	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbtri:scLKQmkk7vzeLkoTHmXsG-Cf2pUFKZDFYbzUhddilgE	2020-11-22 23:12:54.640016+00
uqcxlexx084fzmukzn96ruozp0m4bg9k	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kbtvv:FDBTtL2u-YnVG3lox5DaCr2sjr0nxDnBZY21hakuOvw	2020-11-22 23:17:15.857548+00
ce5uhaufhiph47jypjw5j9q3z30zhnyr	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfEpA:2TJlfpZ1E8rFTtEzRgFmVGQcYPbqJz6F___hwt6wsvo	2020-12-02 04:12:04.128026+00
itm71mwdecpbdh0e8a7qel4qlyq4mgsb	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfWgO:vH0AV3fzAoPQz5aRPGa7e7NmPYSudhaZ3EOF0UcSmeM	2020-12-02 23:16:12.224835+00
fpjyg6pb38y8254uam1rsn0f358l0uo2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfmPd:wSnhWHwDyLiXHTzH1X4z7ja7SHhDnYKKTablbVJeMM0	2020-12-03 16:03:57.323399+00
7f57fiaqr7u15m9fw3tvtomdgaqrj13f	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfmnh:Ea4-_oaCuDRrHWVhb74_h7iGDy_PbJVEoW1vko_xEQo	2020-12-03 16:28:49.686238+00
tj855h77x6bs246u6c4b8mf19l8byzwu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbTg:Gxl-HwUY7gI2A5jGhFnh5I9fRnEiZqVRgVVK8FX7G00	2020-12-03 04:23:24.414463+00
he7a6xxgqwu85cjgotghz68r0f2oden8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbcE:iYiqqZNJp61SYq_P6X3nIGRS0YbR89XTfx5NDsApg3A	2020-12-03 04:32:14.754212+00
exp17x75p7fvl4uyk96t2qlbli6mxnhl	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbgW:kTogWLUM5jmMbv-hEJNcLTkl2DSH4DaKHbGXF8nkHM8	2020-12-03 04:36:40.793367+00
wudm8ibn0zgg13uqk7h4xivkv3fn8qkv	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfmu8:ZxTAEe7lZ5F_8LujqsAUHkbWf85Fjs4uy5b7nqBkIvM	2020-12-03 16:35:28.473865+00
94fusyo7isr1d0pbtxihk2mgjjbmhar9	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbiC:WH_MnDV4nYkw7e6vTJjOfRiTVp19AQAdqZwGouI1A50	2020-12-03 04:38:24.304864+00
96a6q90dpfq8s1d5omsto9q1cz6fo8hu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfnYC:h9DWo---FrJ5LC9KL23qBuCGDB2Rf3yki-FllbUrZPo	2020-12-03 17:16:52.502924+00
dvdjnw5fkv0td5zyx2p8nq15m2rd9q1e	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfmwN:tanw6g4t2zq74bMwx2PumLwDe9laO69GxfxJJnaIKS4	2020-12-03 16:37:47.675394+00
q2x29ps4ezwa9xn23252atnn1naf2tkm	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbs9:cJ5_7kHxFrJIwOgLt5nOZgZ7G9RnuHvLeHmQDgLFMBk	2020-12-03 04:48:41.599958+00
v7b9y1xuz9mqbyanfq1ioevzb1x0l1qh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbu2:jUkryHR_NNmUP9CZD-OjZ70ak5ggchQcwIOKg-ln5ak	2020-12-03 04:50:38.691345+00
rvl0iigkeupwcs0j883xw4sbz5tevfw8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfbvT:4N7JnNwcxAdV3QamXUngSUs6vBpZqSnljOWGuVaU5CI	2020-12-03 04:52:07.35694+00
7m297v3oto51d5oh6onls4uw0xsd5737	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfn3I:8Hf5kN-dWur8RX-TqqmkRjlPr75xQsqnxQe2dBa56QI	2020-12-03 16:44:56.775127+00
dy5d3ldb3v168xqb9izuknn2fyba83j0	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfc0V:p04WlH_BItLaczV1SlDFrylRXji_eS8Uh7L20z1o_Fo	2020-12-03 04:57:19.740569+00
fpqmcy7w5ip0e1sa4ltesbx1q3d31mxe	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfnIt:EJ96VO_JmQdyZ64u2TJE5TUmo3tnFHXFQ-hDEHeM-Nc	2020-12-03 17:01:03.592276+00
uvpexms75tjzmibl855pxdem9fd5qrfx	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfc9A:YMlvueJWKjI1oQW2ziCkBPiip726UJVE4LC1KfzIF2Y	2020-12-03 05:06:16.09942+00
o9cf9g4p5a4ahvjqmlswc15yfph5ldn0	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfndx:9AHEH_OyjAVu-2-_TiALhUpP52r9Bfy-G9ZCv54p-3g	2020-12-03 17:22:49.48929+00
hxsswxjgqs3fnbxd9jjhmv5e6ryvcewv	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfcAQ:qq_1EEtw9fRpCjbVkCt9haJMQxuFNa1NJBL47EkSvTA	2020-12-03 05:07:34.25859+00
fs1gx0mtbcg7pvcagogu2d8s5q6bfvzs	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfcDi:aoNI_NESAV3thK3j2Q1vw04ZWYAMtfbMqE0DnU3EF20	2020-12-03 05:10:58.293421+00
ip07ij05py1n60tiilpw9npyqh0alj62	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfcG3:c24wUGb49RCNGCxnUcudtW6tQRahE1uR6hBEeBBvUWc	2020-12-03 05:13:23.015923+00
tn8bthikeai8op23r862le4vh8f48xzh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfcHi:DfM4xypdr6Uvtjw7-nSp0Z9tGDQs7Kor2IX1l-Yz_H4	2020-12-03 05:15:06.877757+00
5zibn44nfwy92fhbk0w140eox8j0yjsy	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfcKR:GIKuaT90DMDaEUbduW0FhnvxgDXE1imEXYSAaL3PKcM	2020-12-03 05:17:55.43358+00
cjb6yvmr10i9nw89j7tbagy7ckg7kehi	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfntp:CwyGaKU4ItopJ9O2FFzXUhLKULHomrCVDw9LxPSqPp4	2020-12-03 17:39:13.085872+00
wawbyrl1dzes6otzzacyt42vm0p272hz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfnyE:jZ67eGXGMlxQ7ECF-ZhkhPd76kY_qLBmsFrYfp7MlNQ	2020-12-03 17:43:46.030215+00
w41expd3556kku6wznmluyl9oznw9ryo	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfo0n:W-zleneSN5cnXbD9Pxd2_BMCHHE26Jc9rWwoRrBpw2Q	2020-12-03 17:46:25.698124+00
ngik9uokl7dw5atrc59n4o5tlnki3d0l	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfo6G:k2c3IbBMMZabJ8e7lLaukWNyiLwHTzSYH-WQy9JEjFs	2020-12-03 17:52:04.999337+00
7k57wy2y1v9s6tthk1vpcskxiz1f6ntz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfoJL:JB_ZLhrPWK_nsifewALx2DPoJBZMnYUll5VUXatsJgw	2020-12-03 18:05:35.412892+00
1f366rtua0l7l71iji4iad6efatq0kec	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgAhY:slyVpd3-SkjNn5063lch5V5PSXgSmXNccybMks17kAE	2020-12-04 18:00:04.189209+00
rpkxsqqm5nxmxzu83gaexugbsnuskx88	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgdtH:XTmjP3xlOddmYVOMkDCq3BAk2o9_YhyS-XufDmkXwsA	2020-12-06 01:10:07.708877+00
hiagnmp8k2shjoisjs46njr42xbguest	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgiaq:9SvSiEJQ7T2jHzBibO9HazXYEp8RPvugmFrGIUV73uY	2020-12-06 06:11:24.330037+00
sgtq5kwy4vud122mcdkjl6886cuhxr0h	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgugV:YgytbT563JKMTY0TgaURYUoxT5VVJdyoGE3STfeAMPk	2020-12-06 19:06:03.954161+00
mki3gixyf4dg4u739i8ztbglcuuw7lfr	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwlI:jIqOnvtwgP4ElDLOEQYxlrf2QadBioTK8z9pps6eCMk	2020-12-06 21:19:08.514918+00
0iz1mgd1dtrd9009cj2tdcgybh9eqqxs	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwo0:Ae_ThP16Y2VYyc5DIoS8uqk4ZwP4HaV0KmPY4rt_fC4	2020-12-06 21:21:56.688214+00
7aiqpiei1qr9e41qcj5wb9msct7uzw3i	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0l6:Lc0TjAkLCfU532-G3_NYFvJ6hEYhXsHy25xF9pmcJi0	2020-12-07 01:35:12.623966+00
iu6dfe6fsk337pxztl5bn0uk1f1e3rzu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0nT:fJ9Xsd-tT59ve0WkQkGsRU-VtyJiWP2CHp8nbj1Y6bs	2020-12-07 01:37:39.369123+00
pf1x9jo2zpexkpzop7lrehy877urg590	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kk6ep:tGN1zN0CWm61hYtxBor9i9aLhu0u2I-vc4GXY_769Hc	2020-12-15 14:29:31.161249+00
m7sx4fiajv9cdz7rzbmxzg13o5y3k2lw	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0pH:FftRxFhdxXn7T3KKra_LE6veqTaYLanC5Wsa7Z9xyhc	2020-12-07 01:39:31.816314+00
3zfz98mejmykovd6xa0oe13p59ac3j3f	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2OQ:1-J5pT_VAxRbLb2tKZdJR97YTEoPtl6f60QU3RemvJo	2020-12-07 03:19:54.319486+00
qtgcfh7vln0hn3gkbflfc7bbqojehj7v	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPKa:Amn6G3NgNd547n-iBypETmrB-N5mcMV6t4N0CXRCKHM	2020-12-08 03:49:28.785678+00
bpzjdbv0bvu9xq717nstvi3xfy2swccm	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2Qs:S-A4U85lG9KHdxER8F62SVxh8hLeCLnBbpM4vvKLziQ	2020-12-07 03:22:26.640123+00
sihkpvzebrgkbtvg5x3100bwbn0vmdqe	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh4Zn:btn288Nxyg4eL53rWN8jlAewfq3LL4zEjWmzRKA6CSg	2020-12-07 05:39:47.591143+00
sis8rmhe8ukm8qmq5yhzaqfs3urd2fr6	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPO2:_RJMOAlPbowL7FnkeO-HeXzocw7sH1OGrnRHMwI08vY	2020-12-08 03:53:02.266941+00
f717j80uolm1txl4kak34zxdtumvp273	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPS5:qqblvtDk1wYLLtWpMgNOzPLigCpSn6ikbSONbE5-AEg	2020-12-08 03:57:13.496406+00
5rs3iubkr5otz2r2txpmfy1svfzygldq	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfoVg:0dWgRQY6Y7dvy-gykYMJM9Q8duBz1LxWB1ec_yae27M	2020-12-03 18:18:20.833829+00
byujkaz2m4ocwfo1szevxrp3jdsoz2mw	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgB2H:Ek31qoO58hkV-Tsc70j88iR8Pf1udsfSvzDhqDFee8g	2020-12-04 18:21:29.543585+00
1kcs03axervdvelndzphxofyv88d2qp9	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kguvO:bEZOkpYnJ0htakpPIy5ig74pUh2nMWYXgiGAxwsxcps	2020-12-06 19:21:26.121431+00
lxvvsjtlfwav1ax399ys056podvx289k	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgeJG:C7oSUs-HEgFXYPbVndj9AsqOZH2RJs1-MUvZJ9uO29Y	2020-12-06 01:36:58.967071+00
2b9y5u3uszm6mbh33j4isnetnppychhh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khGMS:TpEIbW22Q9VggEdCvzsljfPkBn6C6VHwUck9NLz85aA	2020-12-07 18:14:48.709383+00
jkzv388stqkp2hyr9vqpzgh1strbkcvi	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwqM:PWBdzRJaDN7RJcS0XoBSFvQYt283XvGQ0yg6vfH_SOA	2020-12-06 21:24:22.041593+00
s6ss72mlrvopvwspzdr4g60s8l3rxzbb	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwuf:M8lYcG707TCdJQIj5QoF9IVR52jN30Xk6Xu_Mun2NPU	2020-12-06 21:28:49.130373+00
358x5mfygrq37b9k9d7lsqnw7w3j16ri	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPUZ:w9PdHHQzbTWZu5Gis9QVYWtiI9o4xT8eXkM7dEyshYg	2020-12-08 03:59:47.12942+00
n80ma9o8uweasw56b7j8kmpdqi2coxjh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0tG:5p3yosjNE7OVvFReD88ulx9ZgkLG_W8L1tyhqcZfpig	2020-12-07 01:43:38.49375+00
hulbfaisqx519r3b7y07cyql4rxociwt	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2Vl:JBa0oWP-74rFobtmiQ4IVcKvCPTE8Fh4ndlNQ6bGYxs	2020-12-07 03:27:29.685019+00
7b1pihglcb7ocd23xh8wtc1y4iy7pirc	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPcH:ySrAgmmUUEqsLmK7zIpuI9geEEkHpoeDWoTBQ-ziV9M	2020-12-08 04:07:45.208165+00
ogisdw1l3t2l9zrhcfmmhv6jawdtee5q	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfovr:PtcSvyHzguVG0mvT87GjgIaql3mykxtRsg-LVyWGkkg	2020-12-03 18:45:23.180106+00
47j5382t11xyg6tyytm8i8umszi9wa0g	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgB5p:1G9Lg2EYCyuc7x817aI6NaV-jNwOl7JRxUyKWNfPOkQ	2020-12-04 18:25:09.829694+00
mcb0ly2jq77b1li5ngc0f8yfvqkgl4c2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgv5g:I-u-yiBjNuc_MbjgEWToEgwjrp-G2DLZYH-EaMS2lUU	2020-12-06 19:32:04.823189+00
4gma1cy9vp3jkrwnyqb5tfi0kw6zvhdz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgei1:_TESlt7SAAs_zL9WwsxjCZBc1W4VXXazmtvk-kDhd4w	2020-12-06 02:02:33.649713+00
gk6dsrm3f0yinywsevfq7x1sq341dxt4	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khGQ7:QWrHsIUmo9xTurw9zvLAh1c9YGZAnLcBjK1UmgAsj7Q	2020-12-07 18:18:35.161013+00
fchvjx125cvk7lw4cum3qrcodye3p493	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgipy:4SLwAS1XjyAYdGm_58Bva1y5-EH2OccxCPGdTnqLgpo	2020-12-06 06:27:02.725686+00
y988p60xumfuze8sxlm3gz2a9wt9bsuv	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwsU:RZ1QhK7uKa9lrJJm1oqkV-48c39vncRmoxVIN-3en04	2020-12-06 21:26:34.805496+00
9r7sbemzb8odv6hie8olictidbt5ncfw	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0wi:F3nFeog7t6RU7mA1J4wRh3jWMu7yyD5b9OuzCLndQpA	2020-12-07 01:47:12.954217+00
038za4lw9eqhx7nzg43m87tpb9bnk9jn	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khGXC:_v6SJ1KWZMc9puTutpmFQLWTmssNFcmDKWlQP6HlYpY	2020-12-07 18:25:54.5859+00
dq9mjje929rwoun0gbk8ot857v2yrtvv	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2Yq:JZExAD2jtcGiJ3vraxZngENsDkxwCQBPe0J8yRkqQJg	2020-12-07 03:30:40.421936+00
nrzi4ck586n5u9vor1fzhml130634drg	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPfB:h0X6OymWCvGShcx4S3Cd-I7HxeNmBvMacB-Pmp2WbA4	2020-12-08 04:10:45.590204+00
wftvdhntf4cpozekt9iy2kjo3pfunjxa	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfp1P:iYDbgyl6U_SO8uI55IUy7GpLtSzghtzhYQBqwvkvKfc	2020-12-03 18:51:07.466388+00
rol7wq5vf1f76zlsn9a0s9q4b7vm014h	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgBET:m5o-k7ZeE0N5TSgTg6uHAdSHIWGgioLy1auiTpMPcfE	2020-12-04 18:34:05.549292+00
svi6xwr2lzdlvvct19171dbwa0r1rjuu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvJ0:CEIGc32V9DPwDPcxdZ86rvNAgPMjG2UKAmXqKwK9j1s	2020-12-06 19:45:50.947366+00
zmu24y8w4xlhq4g7ez4ey51b9fjvcyso	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khGiK:utlsVb65_WQobOluIMZNyQdtQ7c_nN_QtBoPMGx2bhQ	2020-12-07 18:37:24.268518+00
mtq4taqpus4dtmskrcvh0g7mcvswuksc	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvKW:iTo30KMQKKTQ9GQqCicMgmiDZ2h4ll7oAH6eOKn0u2o	2020-12-06 19:47:24.63406+00
3mocb671kwsqlfohv8cr7o5hfpu9emnh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgeo4:IcuuNkbqnwE459AwIraKjB3hMSj4l_cqAOqXesOiIag	2020-12-06 02:08:48.660622+00
y7640n3cb0e77kzgtvk7c191o1hjd8r8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kger2:mihWe8OzAAajzYb4ghaIZH5uBEgKlYm7-YTl0syFehw	2020-12-06 02:11:52.321575+00
jya55l43jmm0r0wb6nyjzdy5dnfnbn8c	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgx9k:W9C4ruF-yFlsSZq8jTwIc2_b_KXYpbQj49QtjGX8p1U	2020-12-06 21:44:24.490484+00
jbtqgg2su4rhs9z7he8zx2e4q0wmzgc6	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgivC:bsVprVDplVFeaUZ8GQRNhsvjOaW95hCvQC_IX8l5prQ	2020-12-06 06:32:26.983363+00
ep0jrwwvcjbnkd73ial8ngp9erneubz2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khGrG:u29jPoSJtQJW_YgBCloKc2ApaNXb8W4gsHUVXVJ5ZtQ	2020-12-07 18:46:38.173319+00
7sqgu7ypp3d1hkoblavoc5oj83n2hrtz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxFz:ID-KTKTl0OnqEXwpY-6sDjXzSkb17NoiBqBENRDxk0A	2020-12-06 21:50:51.252215+00
zefnh1hpg22jqcmj7vbte7seus8awwkb	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh15Z:7v0b5EqhHEBJUZAqIVkn74xFKArDKdnc73oZK_teTeg	2020-12-07 01:56:21.211892+00
5oxlj1uvnau0w0tlm43rd0tayphaveyj	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPn6:esP4JrMuTW1EBGU6z3KeWdFh5z52v1sX_HXoGXSC2wY	2020-12-08 04:18:56.580743+00
4xahqd425p41umn725oydo0hv03xt8b7	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2d9:eEsMHrmk25neTAYAxH51aEHL2mHl1gkEUYEak74fpmk	2020-12-07 03:35:07.563902+00
ag9415f89ugeop2903v45wsy60ek2mj4	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2gC:9KyP0VpT1PEmWo1nhOdnchiKUKRREF2vLhrChT2Mf4E	2020-12-07 03:38:16.29134+00
9m8yeepryjiknavm7df51xkm1tz8nrf2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPqT:yft7LCzGe0bmTUaJ-G1u_ZCdS3rq48L_oLZBoRcpRjg	2020-12-08 04:22:25.819422+00
tgxfb99pyloz8jtfm319tkx8619nr6ir	.eJxVjDsOwjAQBe_iGll2_Kek5wzWeneDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeckTibOw4vS7FcAHtx3QHdptlji3dZmK3BV50C6vM_Hzcrh_BxV6_dYlJXBIiqMroymBiVRwADoGPxgmDDai9ZpjwkgphUGb6D2EUSVEMuL9AfxEOCY:1kgI3U:LcFXE7FnEsnLKmUPWO446GsLBsFVH-HyEUYqyfc6EJ0	2020-12-05 01:51:12.884977+00
pdpjp5bvud7lh0e9ivsh8z2x8u2b2afs	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfpst:z--Pr6g4kuQdXRhiXFt7UT4HHQgX_xL3kMMVDoUJF70	2020-12-03 19:46:23.128277+00
byyn0y46z8m7cog8pbynyjt79h6866yq	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvdt:IWHRuk_QtjLMtIWcyvYI57tYI-QKeY9weADQVTe1J5M	2020-12-06 20:07:25.670437+00
jmqb06yd6xjrn8vl1nzdhnheodh56jf0	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgevF:ZjHcrrh2wnxEPaV-79GbyKau1RwPhMwpQRpnY6jCyw0	2020-12-06 02:16:13.114361+00
pvpa9zr1o20rqzuvyjcfk2rl6yfmeugo	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khH23:fSkg2BoOGlwKLQpcTFvIsuhxYdlYnwwNC6ul3weNo2w	2020-12-07 18:57:47.751239+00
s8sh9064ipvgbpw031or38jd4z60iur2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgtMr:0CB-Yqtj_zJEoMmbATz3EH00U9-Z5RjotcvsEjsK-ec	2020-12-06 17:41:41.112097+00
qgau4jk9ezxmvgcmr7z4iwhi4i95zh4l	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPts:fIsaYc-w7h-pN6tXNN52qWEiQgTndr87tamGtdl-Luo	2020-12-08 04:25:56.042034+00
2etdqnnazscbf71jr3ifk5q2hm7qm4jr	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxIl:-gdvoCPDV3mNfpLPydPsMwhz0X5YHuA7g5ujdb40TsY	2020-12-06 21:53:43.889241+00
neughsaigc300vcxbe06liq3rndd2na9	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh18W:sekDPvHETsfrtaSKx0AwXTLhmnAseWB5Oaty7lmRQ00	2020-12-07 01:59:24.862073+00
s9g4ipfpv89j1hdj6w5t3w50029xg6xx	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1Cg:l5Y20-BK2n6OenurBXBz3QiBlmzpOIxdTMAzu0oRRzQ	2020-12-07 02:03:42.105219+00
1fs5t9mcjanez1w6xh0rgm67668rggva	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2kN:o01VIjND1SViFLKQoFvWqykNQYpy8XC4uznUvUv0038	2020-12-07 03:42:35.572623+00
l7hf8pj52cncsr3w8cv2dcm8jers4cka	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2oL:f5Mnz7jw-duOZ6_8zkZDFsHdwqH8vhQ3X5cVcnwp2_A	2020-12-07 03:46:41.554637+00
vbaez93xbppjbj0q1ltbnmbuwd4nozgv	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2tK:MlbocM8AzGtdfTOMCSigHg1XmjSds7XO_MviQozOReA	2020-12-07 03:51:50.233474+00
duj4r8efdtui30rx7gha53lg4jkd0opd	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfppZ:OH-FaPangxgqJ-51bGZsvOKTSKkJVW61Ihq7qS9eqb0	2020-12-03 19:42:57.743369+00
bkyjbgcn80g4o6und703xrcqzn84htj3	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgI8O:chhKB8tJfU27vbrg8i0sfQltXGUUA2drNzhmR9cMjDU	2020-12-05 01:56:16.711542+00
r7wrn6o2ik5x4u3l71ep5x19fxbnvo6r	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvjN:PM1FgSQzxoKZyT-ikPVMkS--BRmY6r3Cfje14azcj40	2020-12-06 20:13:05.609919+00
hl8yty15kjgkjx4l1tpqc1ldwraf570i	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgf18:JoMxEFRUteKiXT0dSw9oV43t0EtK_u0kVvj4EWTivEg	2020-12-06 02:22:18.880504+00
zvaeu4wew3ezfwsulbgdbo9uerrp6wxc	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNPF:acpdGyxiex47AOTC474uZ6buWYKvF_hmQoDZQtjbMkk	2020-12-08 01:46:09.782804+00
gn1gtjh8yq833woa313eb14fd2wsbdjy	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvmc:5euhn5sbA5TtCvmbAcU7olzm0SZoVx91wAaB0KpWoK8	2020-12-06 20:16:26.319595+00
wmm26ncdxfplwudxa1vi0w1r35dj5pzm	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxQH:lAQPCoOH63lZZYJwUPbGqbrtLuWFXSU_QsBmOrAUSXM	2020-12-06 22:01:29.901721+00
j6ozi4mynp8eyloenoubd97mw9nkpjqw	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxSU:HifCPTDdcd2V0at33C0BJHyd3KaW-dK_5vZLUX6WF6U	2020-12-06 22:03:46.905955+00
0b6fv0mnenozw3j1oerj97gm67zm3b7d	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxYc:zc1nztHQh3gWfEuA7jiqbv1ypWsDNUD84sfLCCvBaZU	2020-12-06 22:10:06.972213+00
353c0j8h82w7xdfn1eg3dfzdldymrzf8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khQ8N:TTwCDe5DsCKzhq4mvwH_V8squzvGEwIh0rqmfePy78w	2020-12-08 04:40:55.414171+00
tcdifie3lvzcqdsd4yva881zq270tw8w	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1Ga:JkIJeMQZEvlodbsyqEJKWZlU5c9RdyIQS4mpO24zNw0	2020-12-07 02:07:44.606444+00
yygiwotccmg9ekt9ywg3n9x58p6amm5m	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh32P:xtvnK6zUHV_j3iKxLjUZ6Y0B64z5PqPEZ1F_TEOniOo	2020-12-07 04:01:13.02656+00
pok7cgl5e7q8vl841aifsrzqx9sbq5pn	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfq09:Uhx2nHVLvlCBGeWm12yFVqK1nRa0N9NINWeRRl1XHgY	2020-12-03 19:53:53.413589+00
7mj66y5tjjvmid0mcy19wpcbw2f4hu6p	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgbrk:4stE_zp0Q8gSczLqQI6T5IuY_TN7YX0wq8CIaNqXxbU	2020-12-05 23:00:24.977045+00
0njyzxtur1l489i2tenir69h4rv0cxyr	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvwn:vWTNHRk2tjWUlbgYTOoqLXaRSkBKvtrNP2oExB8sWKQ	2020-12-06 20:26:57.424594+00
5ctc4u7c2zf95ilaz3zgcsqp7rxl884v	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNV9:RTtyzYt_7p0sbpKuZklyRQcWWtNdBQQOWe4RCyXkqKY	2020-12-08 01:52:15.593235+00
r290n9s38etamyypyxivtlcmx35nl6pd	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxaF:pbTEqSBNx7BfRRKY0qHZoQ8uO7lOXubi1H25PDSuVik	2020-12-06 22:11:47.639186+00
x48sdae9torlwwdvot58fdzqwrylewt8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1JP:ntDyQnR4ydIxy_9sjU4vSfnaGd3EbIPl5qMHh3-LQ6o	2020-12-07 02:10:39.615233+00
pg8ieuytd2as6a3b6n2bk7mxafwzx7af	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNWk:46_9kx_Sf5rrbhBHJXJGKPKJAvgfyWFfrL1Kxbb-QOk	2020-12-08 01:53:54.7602+00
ibsdt7rdfxzx8fo72korz8ga6to9lnnz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1NE:KszFKYX_J6mxDaJ28SWqQS1DQz_hWSImgzoJbMoxBZA	2020-12-07 02:14:36.981719+00
rtv9sv1gulawnjo3e1koi56dqw26rbir	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh365:XoT2Q-sFbL6hjbihgfBEVkKiK7Oim2YQh6xNtv8X-VM	2020-12-07 04:05:01.7163+00
apwgpdk2j1cdxniw6kq9gicr8hcijdok	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3E4:5ZjJoVuU32uz94-AkvLJtcrHak7qYl7jXi3kSfhX6NE	2020-12-07 04:13:16.739838+00
3kn3q33ym9u390oejztut7pkyhb5pi14	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgc63:v6nWDHaWhXsS9hMFXJDFwtqw7w4McCr7kYt69GK4Wq0	2020-12-05 23:15:11.345123+00
swzv50klh8lqsyvax58x05t0c5wmhfs1	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgvz4:fR-wklaBFFcbuZoybRaebVGNU3aRksTHhwqtA-WXhGU	2020-12-06 20:29:18.803841+00
nrnvj5ulpdfmf922fvz7dzklj45qzv77	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgfQa:po0xN6erJfOceTbPtD0kMonw_6Q5ASaPLptoSlcEBa8	2020-12-06 02:48:36.57298+00
wx90zwats8b05pnkw837i2m9jn5xt0nq	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNcE:iO_RgoqXyvqqbITzAM9KctAgY-uTggTnJ7ha8ibr0j0	2020-12-08 01:59:34.684291+00
gnfkvblgl4t255h7j41pesj1togeg24n	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgfTe:xkhLPwIY4bWht2xsuLT_WeSCGk-LWkh57l5kDtiWsjI	2020-12-06 02:51:46.302873+00
x2wrnio6gfvwnccfdzrtgqpd2ym7vizw	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgw5j:0ElfJCP4XfgNTEvRdtlRBReZ7nBDY3bdP6q0Ua96ypQ	2020-12-06 20:36:11.888343+00
fl402cp9gyomyn4efpuctes0i2tbwi5z	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgw8j:Zi0MF1byG8Rv2I6vPXOl4o1OvMF3_iNaOEWCOGu_VjU	2020-12-06 20:39:17.624761+00
8fje6gvf4miu3vx02cr93hgbohoijn9u	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNiX:pbnlMoP1SYLAOAx3dKV_5c16UhK7PoSIkmJG5rb-8vw	2020-12-08 02:06:05.348475+00
7z8x06z28v2kl7tk9tx4uu12ju1gywbz	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgxuC:6Ltldg9hC_pVrUBVIJb-Zr7l0s0BkEWkmPqVvWieJy4	2020-12-06 22:32:24.674308+00
tsfritzfyf3ljo0hyxy96jcw71elxgfc	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1Sy:9t3VaioFy_KK_5ePRHZ05dKUbwItAnmOEGE5sQqLeYM	2020-12-07 02:20:32.490633+00
6okpjka2yb1gv4oqio7hlz6u2dg7awnr	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khXyM:4W-_SB3g8jal6yBQiWqM0U1bj7CkumRyI8ih3E7xIT4	2020-12-08 13:03:06.519+00
4jj0f8uip4g4kz4xy0emhsmmn5bxpo54	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh39v:rmgkFnvaMtrK8cMyw_3Ls6Ykk-C7yLk4tWE026PRZqQ	2020-12-07 04:08:59.300732+00
ss2s9raei9i9wntrb2ir14i3u0tiu4h7	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khY1K:qBwOfSnsL1VANkLoUeR3yg-8-9O1H7z6WXxdlJ_Nm0I	2020-12-08 13:06:10.262677+00
y8ddt7l5m3974l0tws0iw4nu5e5pc1qt	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfrF8:QE-86MFqHdjwSxh_Igq7_Yj7g3pYKxIc8dHKStV8EKk	2020-12-03 21:13:26.629411+00
nq5g6xycp74dtsqmd0wvr59ho434ssnt	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgcPA:RlBJZ2yLUuSe7-VUf1coFlK51oGjVL4m8OqYX3qiBxo	2020-12-05 23:34:56.422505+00
ng1i5hu77bg9y29a3f0q3k9dpxxecroh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwCJ:lhRYK1ug7_9xVg19Rtriz5t250GbKN49tE_1O8P9M4I	2020-12-06 20:42:59.812771+00
qkbaspgq5omcj0es3u3yr4o2ttnyuco4	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgfZi:f4Wjk2k-Dx1z7OVaUeOMXvU8JYv2YTaF-aIZTIUvZuQ	2020-12-06 02:58:02.463356+00
bz3oxyi2awgcz7oxhyp9buegw0ziepv0	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNeO:UXgXxZvfhHCfKbfAKfcJE8THPCJz0XbGGl-DePAGAO0	2020-12-08 02:01:48.969402+00
tpwjke0rig7nkfmxx03xgu6v6juanwx3	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwIn:3gkN0KWReKDyKqPN2l--rWHHGO4LYT2cOwOtAOm-gwY	2020-12-06 20:49:41.856903+00
u4q25wnichxccywmlm8q33w7bq8mjy27	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwKH:57dSzDgqYsM2n9fW6Dr8tQRsBSX_JWvezJJomtquu8w	2020-12-06 20:51:13.683186+00
q2rzu5s724vjbn0fc9civfhqk043wvur	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgy8T:zEO5TXGqM7SyBVGCggIzCt2eHA2xuXPnGzG70heTn8I	2020-12-06 22:47:09.623401+00
mmqnvkuzkm0cf7vfluhwiktijqo6f4eh	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3Iy:FdAw2rpR6KV3OFO_fdHrFxdfCrS2Zrp-NNpGDpFtWNQ	2020-12-07 04:18:20.296439+00
n2rxmalqe31nt4zflgxsgvo71948pvza	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3Lb:12iDxXdHnOJbjbQ_Dh38U519gJWqWwVogkRaP7pfxBE	2020-12-07 04:21:03.824105+00
anf2oft58cgj1ck0evp3rx51u2a0xxgu	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfrW3:UXrjxcIEmR09rll4LbcigyR5n1M7p1ac4_MtuW-QeIE	2020-12-03 21:30:55.328801+00
bu7p6aak5xaa7a60br63n4yb37769w1w	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgcVw:hOBNN8Yu6nROO_vO80buDi14K25ZXRQR-xGfs6lAwu4	2020-12-05 23:41:56.839912+00
2isqtjyfm8u5y25ydo7ckd66wsbgp9k7	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwMF:jWUYcXY-kDCFbO4tnI_ufab1Bi2SfDDFznzn2FZGo1Q	2020-12-06 20:53:15.56099+00
0w3fwqftr4tc4d2qdxgn1cph4ofwu7kc	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgfg9:md75VgbHFTrzeSkfpNkS6Yc6v3cbJbhOg5h56UfgEDE	2020-12-06 03:04:41.391504+00
bwe2nemhvoawj47l8c3eukzlw9iqneee	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNmQ:wXfRby0pJTTbZqG-tu4DxRe0Ba5eWRBw1jaPc5AnRrg	2020-12-08 02:10:06.833605+00
6p4s6gntb8wskp74igij34r4nc9f251o	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwPr:VRZ2AQqCB0VjpjUXZ-GbO-xTIrB1V_jElieQGeBq7KA	2020-12-06 20:56:59.379763+00
yxjcj6kg0ov2g0qcqymh80kqif8a5oct	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgyKs:MOFNA7DIvic5F6Hv9rjnnLrlEjVW5BWEte53Z-LIlAo	2020-12-06 22:59:58.634425+00
159ctlvb2yvhp7pcv81i5oam8mgyzgs3	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1ec:Rxmxcj9DFSu9S644vrKAWvHYwLTr0mlEHDw4gSXQyy0	2020-12-07 02:32:34.779062+00
zzeo9rnr5og0i49zqpn0kf3t38dyix55	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3R1:IWhnOazTYI2FYV63Fd-yPAv40ZLL2mQkC4bIq2_Nt5k	2020-12-07 04:26:39.032956+00
p86jyp2nv441skl8ijjpi3gql12fo1va	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfrdZ:7uQ0UsD3eite8GgecRgkr1DOm8kj2XZbVrLSNS_b71g	2020-12-03 21:38:41.920179+00
679bcbgu51bpke96cj09m4si43b56lro	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgck7:_5vr10x7hr-Eanmd7rFd3MviHHP9bP9wHic_L39Ynuw	2020-12-05 23:56:35.649567+00
e3qw1wn5k5rdxnal4qskvmrvgfmz1j8d	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwSA:cEYjsr0DBijmnL9FOcnbHoxGEfmy4uzmz33z4d7mzvo	2020-12-06 20:59:22.959548+00
p0cbbcyaejbwxa6z2bxzp6b4m56ljro3	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgfzT:gUDrrPAL8MMW-haURNBTlOy3SmikOa4QQiUjrDZM16g	2020-12-06 03:24:39.87698+00
45b2j160gn5jzfectg2275fcqv019nk2	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khNp7:0xYF9el9_LBu0gLEuuRs5PyuHBYd8mKWgTzzOAspT50	2020-12-08 02:12:53.488822+00
dics2r0iirh09bnoh0mcti35snauwdgn	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgg6F:2N4rAzkpCnBKWFoO6o8VrbOEfuMhK_3SnExbrC3JEPU	2020-12-06 03:31:39.537378+00
uffdw6ga0ht3bqnz1rsma50gxejkvm01	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgyOE:GTbD6zzvn7HijVropvJ3G-kjon7Yn6jxB3t7g3q56ao	2020-12-06 23:03:26.839259+00
9mpagpwpywf574tk7m7623lihu7nrv4o	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1rf:GzHsGfoJr5wOOZnzuNheqhsVkGUC_cpENbhxjKv35zI	2020-12-07 02:46:03.016029+00
rp780c5vyd09haker5w2z5s3k76rhue5	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3UF:lgThIpKBdia7T05lNUHUeXiE-FnBf4ZBKjna37tU-Y0	2020-12-07 04:29:59.032452+00
lw9fblvml6tgbjp9fq91g8j3gp90ryaq	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3a9:pwxJziV8_iUkg7J8drxWOwRRajAPHG0lVCOq3fJ_jFg	2020-12-07 04:36:05.076818+00
68kaga0mzgucbz4wchlhpjmqi15pnbag	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfrzE:xR0lJ7pNzvG2HruNofebwBAqyDoF6oZGodOKRz_PlZE	2020-12-03 22:01:04.680593+00
u32xqd7f7ierr6qi5z3yqhohb0r0a1k6	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfs3w:rmdOfHemGZQeHWR6q65RCJVJdc88UYj9WKoGjUwo4sY	2020-12-03 22:05:56.27629+00
2mghkx672r1lfg1b5fy7vo8bt8fcqw1q	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgcmr:j33MCAVCLlHFeIOroHgLudcENFkovX-ohcAonyVMpl4	2020-12-05 23:59:25.019757+00
g6s3xjaknvr124sghw0p36q968wzeekg	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwVc:iEMaX1PZnv-kWZMkRCG4wIGa2zqgHLlb5cN6XpAL9TY	2020-12-06 21:02:56.031424+00
r06rfjkiy9pnd2jahrfd4cjrnuhxrr85	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgcqj:ngyLWF0yJGTSpQvbI30RMkgah3mQg0WjOTS8UBPml1w	2020-12-06 00:03:25.946427+00
6jd2pmcy7cb9jonqn72eup562dzrca5u	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPA1:lEekxv1pecMtADUqcrRD0GIMXXq3veIUf95Q7kjyrHo	2020-12-08 03:38:33.84432+00
nszi1frp7bmtw0twqzsifdj8oeghk013	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kggJz:3_S9PWUD2SVbPQwLTGTKgxSLbf7iHOCKNx-yCK5xdM0	2020-12-06 03:45:51.167658+00
0jx2q1dbcs01nysz528etcpibzwqbslk	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwdu:hsdk5F8rniZGRXOwOo_gDSmn_ebgYJ2t5X8fOKI-CqM	2020-12-06 21:11:30.203995+00
gikbs2kqdgai4uyyig46z5j6wzqe91so	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0Hb:Zg2ANhfi6_b4DUrA6gS4N3qqDXpvIpT8FV9DyfMfliQ	2020-12-07 01:04:43.234103+00
ijwzc1ez9el4d9ykiqbee2lmc4pjt9tb	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh1zI:t6tb9kAr7RZ15M4v7cD0u1DAwYN2BpzxRNU7D7OnA8c	2020-12-07 02:53:56.428987+00
huvj2fjjb7liymztdnzm844wvngejcjw	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3hI:blLMBqVvIZZ9ZUUmJtRzeBM7GQbWmFmBs0FA3Zx5TFU	2020-12-07 04:43:28.611746+00
q2gz42zp1pl822bnswrni0rnllp72pwj	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kfscC:3heURlP_3av8neRO2ZrqGVYrl3xTdEGn5CuvkXrF8nE	2020-12-03 22:41:20.368947+00
syjuc2qe94kg4tpw7wmeyu1czvxi8aaa	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgcyA:mQYcGSIGOZVIptbPiMI8DhCMDo7AJFTCpTHyl_aqA9I	2020-12-06 00:11:06.829137+00
yhoxf0q5m4rrbif8ftsrfsx2rblseb76	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwXe:08JdWMZ-GbMU0D2WpRTqjhsMgqWRcbKD07drCfHJ_x0	2020-12-06 21:05:02.53769+00
wtzizzfkoke5oy4nlhpi0ybyuaf27ml9	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgiO6:g8eWPJDxwdz1TqVhHqJ8-lGKEJmLU4uHJl6Q7m0z9wA	2020-12-06 05:58:14.455816+00
1mqte1x4606qjl72h4keci5fxytkxrij	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPDM:D_AA5aTtmHL8UL7hQNGonnO0Vs7hXRtPVprCoZrEoJk	2020-12-08 03:42:00.848663+00
gpian04rje9q4ejf8f8io7iq33gabyjn	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kgwfZ:lopFzAYwTc7I32aqAJ_kcRmif-5LMl_2zfh3Rnv_IWs	2020-12-06 21:13:13.81193+00
rfexogupik54z09y82efppvv4jfhssp8	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1khPFS:7gEQOR3ga6o8GDjmZ6RXTpKl0uMHYIYNVR88M2AlsSI	2020-12-08 03:44:10.840622+00
fi60jnelqcxk7zj59g15t1fuokmcp88r	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh0iN:SlIuiSgurAxeiypKPdzXnaUDczq0MF_c3v0fKcR4Smg	2020-12-07 01:32:23.213291+00
0r61xczd68te2pduogvej7uzjahum73f	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh2EO:PTTdKVT0R45TkQ6CokNqEC4SB77xgWrJ3sVhiu98U2Y	2020-12-07 03:09:32.801713+00
vimzqb41wbdb236yleeuca0irggv9zro	.eJxVjDsOwjAQBe_iGln-yGugpOcM1q69iwPIluKkQtwdIqWA9s3Me6mE61LTOnhOU1FnZdXhdyPMD24bKHdst65zb8s8kd4UvdOhr73w87K7fwcVR_3WjizYSBKFhDAYgRyIIRiSAsCe2bkgDkz00Z0KhmAlAh_JWCgevXp_AP3wOCw:1kh3rG:x7xDJUlAOq1hUoM47AYWOdOefKm_NOB1_5AZou6vCoU	2020-12-07 04:53:46.841603+00
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.files (sensor_id, file_name) FROM stdin;
\.


--
-- Data for Name: inlet_switcher_state; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.inlet_switcher_state ("Datetime", inlet_selected, inlet_1_state, inlet_2_state, inlet_name) FROM stdin;
2020-11-23 13:10:25.133+00	1	1B	2B	Interstitial
2020-11-23 13:14:08.665+00	3	1B	2A	Total
2020-11-23 13:14:44.051+00	3	1B	2A	Total
2020-11-23 13:15:23.513+00	3	1B	2A	Total
2020-11-23 13:15:37.687+00	1	1B	2B	Interstitial
2020-11-23 13:15:51.782+00	3	1B	2A	Total
2020-11-23 13:16:08.876+00	3	1B	2A	Total
2020-11-23 13:16:22.936+00	1	1B	2B	Interstitial
2020-11-23 13:16:37.039+00	3	1B	2A	Total
2020-11-23 13:16:53.616+00	3	1B	2A	Total
2020-11-23 13:17:07.71+00	1	1B	2B	Interstitial
2020-11-23 13:17:21.918+00	3	1B	2A	Total
2020-11-23 13:17:40.702+00	3	1B	2A	Total
2020-11-23 13:17:55.194+00	1	1B	2B	Interstitial
2020-11-23 13:18:14.699+00	3	1B	2A	Total
2020-11-23 13:18:34.714+00	3	1B	2A	Total
2020-11-23 13:18:51.18+00	1	1B	2B	Interstitial
2020-11-23 13:19:05.508+00	3	1B	2A	Total
2020-11-23 13:19:22.405+00	3	1B	2A	Total
2020-11-23 13:19:36.919+00	1	1B	2B	Interstitial
2020-11-23 13:19:50.996+00	3	1B	2A	Total
2020-11-23 13:20:07.65+00	3	1B	2A	Total
2020-11-23 13:20:21.708+00	1	1B	2B	Interstitial
2020-11-23 13:20:36.058+00	3	1B	2A	Total
2020-11-23 13:20:52.89+00	3	1B	2A	Total
2020-11-23 13:21:06.986+00	1	1B	2B	Interstitial
2020-11-23 13:21:21.173+00	3	1B	2A	Total
2020-11-23 13:21:37.821+00	3	1B	2A	Total
2020-11-23 13:21:51.982+00	1	1B	2B	Interstitial
2020-11-23 13:22:06.662+00	3	1B	2A	Total
2020-11-23 13:22:23.476+00	3	1B	2A	Total
2020-11-23 13:22:37.576+00	1	1B	2B	Interstitial
2020-11-23 13:22:51.66+00	3	1B	2A	Total
2020-11-23 13:23:08.306+00	3	1B	2A	Total
2020-11-23 13:23:22.664+00	1	1B	2B	Interstitial
2020-11-23 13:23:36.774+00	3	1B	2A	Total
2020-11-23 13:23:53.479+00	3	1B	2A	Total
2020-11-23 13:24:09.427+00	1	1B	2B	Interstitial
2020-11-23 13:24:23.484+00	3	1B	2A	Total
2020-11-23 13:24:40.112+00	3	1B	2A	Total
2020-11-23 13:24:54.195+00	1	1B	2B	Interstitial
2020-11-23 13:25:08.268+00	3	1B	2A	Total
2020-11-23 13:25:25.258+00	3	1B	2A	Total
2020-11-23 13:25:39.528+00	1	1B	2B	Interstitial
2020-11-23 13:25:53.607+00	3	1B	2A	Total
2020-11-23 13:26:10.196+00	3	1B	2A	Total
2020-11-23 13:26:24.267+00	1	1B	2B	Interstitial
2020-11-23 13:26:38.371+00	3	1B	2A	Total
2020-11-23 13:26:55.305+00	3	1B	2A	Total
2020-11-23 13:27:09.37+00	1	1B	2B	Interstitial
2020-11-23 13:27:23.534+00	3	1B	2A	Total
2020-11-23 13:27:40.187+00	3	1B	2A	Total
2020-11-23 13:27:54.247+00	1	1B	2B	Interstitial
2020-11-23 13:28:08.334+00	3	1B	2A	Total
2020-11-23 13:28:25.185+00	3	1B	2A	Total
2020-11-23 13:28:39.295+00	1	1B	2B	Interstitial
2020-11-23 13:28:53.323+00	3	1B	2A	Total
2020-11-23 13:29:09.986+00	3	1B	2A	Total
2020-11-23 13:29:24.027+00	1	1B	2B	Interstitial
2020-11-23 13:29:38.071+00	3	1B	2A	Total
2020-11-23 13:29:54.909+00	3	1B	2A	Total
2020-11-23 13:30:09.238+00	1	1B	2B	Interstitial
2020-11-23 13:30:23.413+00	3	1B	2A	Total
2020-11-23 13:30:40.18+00	3	1B	2A	Total
2020-11-23 13:30:54.311+00	1	1B	2B	Interstitial
2020-11-23 13:31:08.354+00	3	1B	2A	Total
2020-11-23 13:31:24.991+00	3	1B	2A	Total
2020-11-23 13:31:39.15+00	1	1B	2B	Interstitial
2020-11-23 13:31:53.331+00	3	1B	2A	Total
2020-11-23 13:32:10.118+00	3	1B	2A	Total
2020-11-23 13:32:24.162+00	1	1B	2B	Interstitial
2020-11-23 13:32:38.273+00	3	1B	2A	Total
2020-11-23 13:32:54.914+00	3	1B	2A	Total
2020-11-23 13:33:09.027+00	1	1B	2B	Interstitial
2020-11-23 13:33:23.195+00	3	1B	2A	Total
2020-11-23 13:33:40.168+00	3	1B	2A	Total
2020-11-23 13:33:54.391+00	1	1B	2B	Interstitial
2020-11-23 13:34:08.517+00	3	1B	2A	Total
2020-11-23 13:34:25.183+00	3	1B	2A	Total
2020-11-23 13:34:39.209+00	1	1B	2B	Interstitial
2020-11-23 13:34:53.292+00	3	1B	2A	Total
2020-11-23 13:35:09.903+00	3	1B	2A	Total
2020-11-23 13:35:24.132+00	1	1B	2B	Interstitial
2020-11-23 13:35:38.175+00	3	1B	2A	Total
2020-11-23 13:35:54.777+00	3	1B	2A	Total
2020-11-23 13:36:08.935+00	1	1B	2B	Interstitial
2020-11-23 13:36:23.112+00	3	1B	2A	Total
2020-11-23 13:36:39.749+00	3	1B	2A	Total
2020-11-23 13:36:53.791+00	1	1B	2B	Interstitial
2020-11-23 13:37:08.005+00	3	1B	2A	Total
2020-11-23 13:37:24.654+00	3	1B	2A	Total
2020-11-23 13:37:38.773+00	1	1B	2B	Interstitial
2020-11-23 13:37:52.87+00	3	1B	2A	Total
2020-11-23 13:38:09.481+00	3	1B	2A	Total
2020-11-23 13:38:23.847+00	1	1B	2B	Interstitial
2020-11-23 13:38:38.066+00	3	1B	2A	Total
2020-11-23 13:38:54.952+00	3	1B	2A	Total
2020-11-23 13:39:09.077+00	1	1B	2B	Interstitial
2020-11-23 13:39:23.236+00	3	1B	2A	Total
2020-11-23 13:39:39.902+00	3	1B	2A	Total
2020-11-23 13:39:54.113+00	1	1B	2B	Interstitial
2020-11-23 13:40:08.357+00	3	1B	2A	Total
2020-11-23 13:40:25.086+00	3	1B	2A	Total
2020-11-23 13:40:39.101+00	1	1B	2B	Interstitial
2020-11-23 13:40:53.238+00	3	1B	2A	Total
2020-11-23 13:41:09.92+00	3	1B	2A	Total
2020-11-23 13:41:24.085+00	1	1B	2B	Interstitial
2020-11-23 13:41:38.324+00	3	1B	2A	Total
2020-11-23 13:41:55.476+00	3	1B	2A	Total
2020-11-23 13:42:09.824+00	1	1B	2B	Interstitial
2020-11-23 13:42:24.498+00	3	1B	2A	Total
2020-11-23 13:42:43.014+00	3	1B	2A	Total
2020-11-23 13:42:58.145+00	1	1B	2B	Interstitial
2020-11-23 13:43:12.61+00	3	1B	2A	Total
2020-11-23 13:43:29.959+00	3	1B	2A	Total
2020-11-23 13:43:44.286+00	1	1B	2B	Interstitial
2020-11-23 13:43:58.636+00	3	1B	2A	Total
2020-11-23 13:44:15.567+00	3	1B	2A	Total
2020-11-23 13:44:29.695+00	1	1B	2B	Interstitial
2020-11-23 13:44:43.722+00	3	1B	2A	Total
2020-11-23 13:45:00.524+00	3	1B	2A	Total
2020-11-23 13:45:14.593+00	1	1B	2B	Interstitial
2020-11-23 13:45:28.653+00	3	1B	2A	Total
2020-11-23 13:45:45.235+00	3	1B	2A	Total
2020-11-23 13:45:59.317+00	1	1B	2B	Interstitial
2020-11-23 13:46:13.408+00	3	1B	2A	Total
2020-11-23 13:46:30.197+00	3	1B	2A	Total
2020-11-23 13:46:44.673+00	1	1B	2B	Interstitial
2020-11-23 13:46:59.147+00	3	1B	2A	Total
2020-11-23 13:47:15.784+00	3	1B	2A	Total
2020-11-23 13:47:29.841+00	1	1B	2B	Interstitial
2020-11-23 13:47:43.922+00	3	1B	2A	Total
2020-11-23 13:48:00.705+00	3	1B	2A	Total
2020-11-23 13:48:14.908+00	1	1B	2B	Interstitial
2020-11-23 13:48:29.038+00	3	1B	2A	Total
2020-11-23 13:48:45.673+00	3	1B	2A	Total
2020-11-23 13:48:59.868+00	1	1B	2B	Interstitial
2020-11-23 13:49:14.056+00	3	1B	2A	Total
2020-11-23 13:49:31.06+00	3	1B	2A	Total
2020-11-23 13:49:45.267+00	1	1B	2B	Interstitial
2020-11-23 13:49:59.593+00	3	1B	2A	Total
2020-11-23 13:50:16.877+00	3	1B	2A	Total
2020-11-23 13:50:31.057+00	1	1B	2B	Interstitial
2020-11-23 13:50:45.283+00	3	1B	2A	Total
2020-11-23 13:51:02.565+00	3	1B	2A	Total
2020-11-23 13:51:17.025+00	1	1B	2B	Interstitial
2020-11-23 13:51:31.381+00	3	1B	2A	Total
2020-11-23 13:51:48.262+00	3	1B	2A	Total
2020-11-23 13:52:02.442+00	1	1B	2B	Interstitial
2020-11-23 13:52:16.652+00	3	1B	2A	Total
2020-11-23 13:52:33.317+00	3	1B	2A	Total
2020-11-23 13:52:48.496+00	1	1B	2B	Interstitial
2020-11-23 13:53:02.65+00	3	1B	2A	Total
2020-11-23 13:53:19.469+00	3	1B	2A	Total
2020-11-23 13:53:33.66+00	1	1B	2B	Interstitial
2020-11-23 13:53:47.724+00	3	1B	2A	Total
2020-11-23 13:54:04.632+00	3	1B	2A	Total
2020-11-23 13:54:18.769+00	1	1B	2B	Interstitial
2020-11-23 13:54:33.453+00	3	1B	2A	Total
2020-11-23 13:54:50.816+00	3	1B	2A	Total
2020-11-23 13:55:04.942+00	1	1B	2B	Interstitial
2020-11-23 13:55:19.533+00	3	1B	2A	Total
2020-11-23 13:55:36.552+00	3	1B	2A	Total
2020-11-23 13:55:51.06+00	1	1B	2B	Interstitial
2020-11-23 13:56:05.449+00	3	1B	2A	Total
2020-11-23 13:56:22.672+00	3	1B	2A	Total
2020-11-23 13:56:36.777+00	1	1B	2B	Interstitial
2020-11-23 13:56:51.29+00	3	1B	2A	Total
2020-11-23 13:57:11.121+00	3	1B	2A	Total
2020-11-23 13:57:26.557+00	1	1B	2B	Interstitial
2020-11-23 13:57:41.906+00	3	1B	2A	Total
2020-11-23 13:57:58.825+00	3	1B	2A	Total
2020-11-23 13:58:13.456+00	1	1B	2B	Interstitial
2020-11-23 13:58:27.584+00	3	1B	2A	Total
2020-11-23 13:58:44.983+00	3	1B	2A	Total
2020-11-23 13:58:59.349+00	1	1B	2B	Interstitial
2020-11-23 13:59:13.494+00	3	1B	2A	Total
2020-11-23 13:59:31.595+00	3	1B	2A	Total
2020-11-23 13:59:46.212+00	1	1B	2B	Interstitial
2020-11-23 14:00:00.623+00	3	1B	2A	Total
2020-11-23 14:00:17.818+00	3	1B	2A	Total
2020-11-23 14:00:32.095+00	1	1B	2B	Interstitial
2020-11-23 14:00:46.858+00	3	1B	2A	Total
2020-11-23 14:01:03.848+00	3	1B	2A	Total
2020-11-23 14:01:18.221+00	1	1B	2B	Interstitial
2020-11-23 14:01:32.327+00	3	1B	2A	Total
2020-11-23 14:01:49.232+00	3	1B	2A	Total
2020-11-23 14:02:03.706+00	1	1B	2B	Interstitial
2020-11-23 14:02:17.806+00	3	1B	2A	Total
2020-11-23 14:02:35.159+00	3	1B	2A	Total
2020-11-23 14:02:50.193+00	1	1B	2B	Interstitial
2020-11-23 14:03:04.388+00	3	1B	2A	Total
2020-11-23 14:03:21.34+00	3	1B	2A	Total
2020-11-23 14:03:35.833+00	1	1B	2B	Interstitial
2020-11-23 14:03:50.197+00	3	1B	2A	Total
2020-11-23 14:04:06.991+00	3	1B	2A	Total
2020-11-23 14:04:23.242+00	1	1B	2B	Interstitial
2020-11-23 14:04:38.005+00	3	1B	2A	Total
2020-11-23 14:04:55.491+00	3	1B	2A	Total
2020-11-23 14:05:09.872+00	1	1B	2B	Interstitial
2020-11-23 14:05:25.019+00	3	1B	2A	Total
2020-11-23 14:05:41.875+00	3	1B	2A	Total
2020-11-23 14:05:56.067+00	1	1B	2B	Interstitial
2020-11-23 14:06:10.452+00	3	1B	2A	Total
2020-11-23 14:06:27.626+00	3	1B	2A	Total
2020-11-23 14:06:42.356+00	1	1B	2B	Interstitial
2020-11-23 14:06:56.533+00	3	1B	2A	Total
2020-11-23 14:07:13.734+00	3	1B	2A	Total
2020-11-23 14:07:28.15+00	1	1B	2B	Interstitial
2020-11-23 14:07:42.296+00	3	1B	2A	Total
2020-11-23 14:07:59.197+00	3	1B	2A	Total
2020-11-23 14:08:13.248+00	1	1B	2B	Interstitial
2020-11-23 14:08:27.794+00	3	1B	2A	Total
2020-11-23 14:08:44.813+00	3	1B	2A	Total
2020-11-23 14:08:58.912+00	1	1B	2B	Interstitial
2020-11-23 14:09:13.207+00	3	1B	2A	Total
2020-11-23 14:09:30.001+00	3	1B	2A	Total
2020-11-23 14:09:44.209+00	1	1B	2B	Interstitial
2020-11-23 14:09:58.493+00	3	1B	2A	Total
2020-11-23 14:10:15.465+00	3	1B	2A	Total
2020-11-23 14:10:29.674+00	1	1B	2B	Interstitial
2020-11-23 14:10:43.842+00	3	1B	2A	Total
2020-11-23 14:11:00.589+00	3	1B	2A	Total
2020-11-23 14:11:14.604+00	1	1B	2B	Interstitial
2020-11-23 14:11:28.702+00	3	1B	2A	Total
2020-11-23 14:11:45.603+00	3	1B	2A	Total
2020-11-23 14:11:59.903+00	1	1B	2B	Interstitial
2020-11-23 14:12:14.177+00	3	1B	2A	Total
2020-11-23 14:12:30.949+00	3	1B	2A	Total
2020-11-23 14:12:45.064+00	1	1B	2B	Interstitial
2020-11-23 14:12:59.323+00	3	1B	2A	Total
2020-11-23 14:13:16.048+00	3	1B	2A	Total
2020-11-23 14:13:30.274+00	1	1B	2B	Interstitial
2020-11-23 14:13:44.36+00	3	1B	2A	Total
2020-11-23 14:14:00.977+00	3	1B	2A	Total
2020-11-23 14:14:15.47+00	1	1B	2B	Interstitial
2020-11-23 14:14:29.548+00	3	1B	2A	Total
2020-11-23 14:14:46.588+00	3	1B	2A	Total
2020-11-23 14:15:00.934+00	1	1B	2B	Interstitial
2020-11-23 14:15:15.264+00	3	1B	2A	Total
2020-11-23 14:15:31.917+00	3	1B	2A	Total
2020-11-23 14:15:46.045+00	1	1B	2B	Interstitial
2020-11-23 14:16:00.306+00	3	1B	2A	Total
2020-11-23 14:16:17.056+00	3	1B	2A	Total
2020-11-23 14:16:31.195+00	1	1B	2B	Interstitial
2020-11-23 14:16:45.766+00	3	1B	2A	Total
2020-11-23 14:17:02.386+00	3	1B	2A	Total
2020-11-23 14:17:16.879+00	1	1B	2B	Interstitial
2020-11-23 14:17:31.075+00	3	1B	2A	Total
2020-11-23 14:17:48.341+00	3	1B	2A	Total
2020-11-23 14:18:02.55+00	1	1B	2B	Interstitial
2020-11-23 14:18:16.911+00	3	1B	2A	Total
2020-11-23 14:18:35.282+00	3	1B	2A	Total
2020-11-23 14:18:50.826+00	1	1B	2B	Interstitial
2020-11-23 14:19:04.986+00	3	1B	2A	Total
2020-11-23 14:19:22.038+00	3	1B	2A	Total
2020-11-23 14:19:36.416+00	1	1B	2B	Interstitial
2020-11-23 14:19:50.781+00	3	1B	2A	Total
2020-11-23 14:20:07.915+00	3	1B	2A	Total
2020-11-23 14:20:22.385+00	1	1B	2B	Interstitial
2020-11-23 14:20:36.56+00	3	1B	2A	Total
2020-11-23 14:20:53.563+00	3	1B	2A	Total
2020-11-23 14:21:07.79+00	1	1B	2B	Interstitial
2020-11-23 14:21:22.049+00	3	1B	2A	Total
2020-11-23 14:21:38.897+00	3	1B	2A	Total
2020-11-23 14:21:53.143+00	1	1B	2B	Interstitial
2020-11-23 14:22:07.903+00	3	1B	2A	Total
2020-11-23 14:22:25.272+00	3	1B	2A	Total
2020-11-23 14:22:39.416+00	1	1B	2B	Interstitial
2020-11-23 14:22:53.892+00	3	1B	2A	Total
2020-11-23 14:23:10.945+00	3	1B	2A	Total
2020-11-23 14:23:25.039+00	1	1B	2B	Interstitial
2020-11-23 14:23:39.228+00	3	1B	2A	Total
2020-11-23 14:23:55.959+00	3	1B	2A	Total
2020-11-23 14:24:10.106+00	1	1B	2B	Interstitial
2020-11-23 14:24:24.465+00	3	1B	2A	Total
2020-11-23 14:24:41.515+00	3	1B	2A	Total
2020-11-23 14:24:55.759+00	1	1B	2B	Interstitial
2020-11-23 14:25:09.984+00	3	1B	2A	Total
2020-11-23 14:25:26.766+00	3	1B	2A	Total
2020-11-23 14:25:41.167+00	1	1B	2B	Interstitial
2020-11-23 14:25:55.366+00	3	1B	2A	Total
2020-11-23 14:26:12.313+00	3	1B	2A	Total
2020-11-23 14:26:26.903+00	1	1B	2B	Interstitial
2020-11-23 14:26:41.387+00	3	1B	2A	Total
2020-11-23 14:26:58.929+00	3	1B	2A	Total
2020-11-23 14:27:13.444+00	1	1B	2B	Interstitial
2020-11-23 14:27:27.672+00	3	1B	2A	Total
2020-11-23 14:27:45.026+00	3	1B	2A	Total
2020-11-23 14:27:59.549+00	1	1B	2B	Interstitial
2020-11-23 14:28:13.714+00	3	1B	2A	Total
2020-11-23 14:28:30.746+00	3	1B	2A	Total
2020-11-23 14:28:45.293+00	1	1B	2B	Interstitial
2020-11-23 14:28:59.723+00	3	1B	2A	Total
2020-11-23 14:29:17.15+00	3	1B	2A	Total
2020-11-23 14:29:31.382+00	1	1B	2B	Interstitial
2020-11-23 14:29:45.626+00	3	1B	2A	Total
2020-11-23 14:30:02.581+00	3	1B	2A	Total
2020-11-23 14:30:18.274+00	1	1B	2B	Interstitial
2020-11-23 14:30:35.781+00	3	1B	2A	Total
2020-11-23 14:30:53.624+00	3	1B	2A	Total
2020-11-23 14:31:08.402+00	1	1B	2B	Interstitial
2020-11-23 14:31:22.794+00	3	1B	2A	Total
2020-11-23 14:31:40.015+00	3	1B	2A	Total
2020-11-23 14:31:54.847+00	1	1B	2B	Interstitial
2020-11-23 14:32:09.293+00	3	1B	2A	Total
2020-11-23 14:32:26.631+00	3	1B	2A	Total
2020-11-23 14:32:41.525+00	1	1B	2B	Interstitial
2020-11-23 14:32:56.011+00	3	1B	2A	Total
2020-11-23 14:33:13.7+00	3	1B	2A	Total
2020-11-23 14:33:27.949+00	1	1B	2B	Interstitial
2020-11-23 14:33:42.15+00	3	1B	2A	Total
2020-11-23 14:33:59.061+00	3	1B	2A	Total
2020-11-23 14:34:13.419+00	1	1B	2B	Interstitial
2020-11-23 14:34:27.914+00	3	1B	2A	Total
2020-11-23 14:34:44.713+00	3	1B	2A	Total
2020-11-23 14:34:58.926+00	1	1B	2B	Interstitial
2020-11-23 14:35:13.12+00	3	1B	2A	Total
2020-11-23 14:35:30.244+00	3	1B	2A	Total
2020-11-23 14:35:44.52+00	1	1B	2B	Interstitial
2020-11-23 14:35:59.106+00	3	1B	2A	Total
2020-11-23 14:36:15.991+00	3	1B	2A	Total
2020-11-23 14:36:30.342+00	1	1B	2B	Interstitial
2020-11-23 14:36:44.704+00	3	1B	2A	Total
2020-11-23 14:37:02.039+00	3	1B	2A	Total
2020-11-23 14:37:17.054+00	1	1B	2B	Interstitial
2020-11-23 14:37:31.171+00	3	1B	2A	Total
2020-11-23 14:37:48.072+00	3	1B	2A	Total
2020-11-23 14:38:02.215+00	1	1B	2B	Interstitial
2020-11-23 14:38:16.726+00	3	1B	2A	Total
2020-11-23 14:38:34.461+00	3	1B	2A	Total
2020-11-23 14:38:49.156+00	1	1B	2B	Interstitial
2020-11-23 14:39:03.315+00	3	1B	2A	Total
2020-11-23 14:39:20.526+00	3	1B	2A	Total
2020-11-23 14:39:35.323+00	1	1B	2B	Interstitial
2020-11-23 14:39:50.717+00	3	1B	2A	Total
2020-11-23 14:40:07.609+00	3	1B	2A	Total
2020-11-23 14:40:22.315+00	1	1B	2B	Interstitial
2020-11-23 14:40:37.23+00	3	1B	2A	Total
2020-11-23 14:40:54.529+00	3	1B	2A	Total
2020-11-23 14:41:08.771+00	1	1B	2B	Interstitial
2020-11-23 14:41:22.837+00	3	1B	2A	Total
2020-11-23 14:41:39.995+00	3	1B	2A	Total
2020-11-23 14:41:54.135+00	1	1B	2B	Interstitial
2020-11-23 14:42:08.38+00	3	1B	2A	Total
2020-11-23 14:42:25.376+00	3	1B	2A	Total
2020-11-23 14:42:39.618+00	1	1B	2B	Interstitial
2020-11-23 14:42:53.746+00	3	1B	2A	Total
2020-11-23 14:43:10.828+00	3	1B	2A	Total
2020-11-23 14:43:25.323+00	1	1B	2B	Interstitial
2020-11-23 14:43:39.911+00	3	1B	2A	Total
2020-11-23 14:43:56.949+00	3	1B	2A	Total
2020-11-23 14:44:11.208+00	1	1B	2B	Interstitial
2020-11-23 14:44:25.806+00	3	1B	2A	Total
2020-11-23 14:44:43.342+00	3	1B	2A	Total
2020-11-23 14:44:58.249+00	1	1B	2B	Interstitial
2020-11-23 14:45:12.559+00	3	1B	2A	Total
2020-11-23 14:45:29.353+00	3	1B	2A	Total
2020-11-23 14:45:43.618+00	1	1B	2B	Interstitial
2020-11-23 14:45:57.898+00	3	1B	2A	Total
2020-11-23 14:46:15.48+00	3	1B	2A	Total
2020-11-23 14:46:29.975+00	1	1B	2B	Interstitial
2020-11-23 14:46:44.135+00	3	1B	2A	Total
2020-11-23 14:47:01.069+00	3	1B	2A	Total
2020-11-23 14:47:15.48+00	1	1B	2B	Interstitial
2020-11-23 14:47:29.778+00	3	1B	2A	Total
2020-11-23 14:47:46.88+00	3	1B	2A	Total
2020-11-23 14:48:01.268+00	1	1B	2B	Interstitial
2020-11-23 14:48:15.799+00	3	1B	2A	Total
2020-11-23 14:48:33.322+00	3	1B	2A	Total
2020-11-23 14:48:47.643+00	1	1B	2B	Interstitial
2020-11-23 14:49:01.815+00	3	1B	2A	Total
2020-11-23 14:49:18.587+00	3	1B	2A	Total
2020-11-23 14:49:33.058+00	1	1B	2B	Interstitial
2020-11-23 14:49:47.364+00	3	1B	2A	Total
2020-11-23 14:50:04.619+00	3	1B	2A	Total
2020-11-23 14:50:18.899+00	1	1B	2B	Interstitial
2020-11-23 14:50:32.993+00	3	1B	2A	Total
2020-11-23 14:50:51.063+00	3	1B	2A	Total
2020-11-23 14:51:05.478+00	1	1B	2B	Interstitial
2020-11-23 14:51:19.971+00	3	1B	2A	Total
2020-11-23 14:51:37.324+00	3	1B	2A	Total
2020-11-23 14:51:51.654+00	1	1B	2B	Interstitial
2020-11-23 14:52:05.784+00	3	1B	2A	Total
2020-11-23 14:52:22.572+00	3	1B	2A	Total
2020-11-23 14:52:37.022+00	1	1B	2B	Interstitial
2020-11-23 14:52:51.689+00	3	1B	2A	Total
2020-11-23 14:53:10.963+00	3	1B	2A	Total
2020-11-23 14:53:25.457+00	1	1B	2B	Interstitial
2020-11-23 14:53:41.074+00	3	1B	2A	Total
2020-11-23 14:54:01.967+00	3	1B	2A	Total
2020-11-23 14:54:16.111+00	1	1B	2B	Interstitial
2020-11-23 14:54:30.526+00	3	1B	2A	Total
2020-11-23 14:54:47.447+00	3	1B	2A	Total
2020-11-23 14:55:01.973+00	1	1B	2B	Interstitial
2020-11-23 14:55:16.288+00	3	1B	2A	Total
2020-11-23 14:55:33.51+00	3	1B	2A	Total
2020-11-23 14:55:47.742+00	1	1B	2B	Interstitial
2020-11-23 14:56:03.225+00	3	1B	2A	Total
2020-11-23 14:56:21.027+00	3	1B	2A	Total
2020-11-23 15:20:33.835+00	3	1B	2A	Total
2020-11-23 15:20:49.551+00	1	1B	2B	Interstitial
2020-11-23 15:21:05.407+00	3	1B	2A	Total
2020-11-23 15:21:24.877+00	3	1B	2A	Total
2020-11-23 15:21:42.469+00	1	1B	2B	Interstitial
2020-11-23 15:21:57.878+00	3	1B	2A	Total
2020-11-23 15:22:19.641+00	3	1B	2A	Total
2020-11-23 15:22:34.72+00	1	1B	2B	Interstitial
\.


--
-- Data for Name: primary_variables; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.primary_variables (id, "Variable Name", "Parameter Unit", "Housekeeping", "Available", "Sensor id") FROM stdin;
4	Water vapor mixing ratio	g/kg	t	f	2
8	Number Concentration	cm^-3	t	t	1
1	Super Saturation	%	t	t	1
9	Sample Flow Rate	LPM	t	t	3
2	Sample Flow Rate	LPM	t	t	1
12	Sheath Flow Rate	LPM	t	t	1
13	Sheath Flow Rate	LPM	t	t	3
14	Relative Humidity	%	t	t	3
15	Sheath Sample Pressure	LPM	t	t	3
20	Precipitation Rate	N/A	t	t	7
17	Sheath Sample Pressure	LPM	t	t	4
6	Relative Humidity	%	t	t	2
10	Sample Flow Rate	LPM	f	f	4
3	Water Vapor Content	g/m^3	t	t	2
5	Water Vapor Pressure	mb	t	t	2
7	Water Vapor Temperature	C	t	t	2
19	Transmittance B	N/A	t	t	5
18	Transmittance	N/A	t	t	5
11	Aerosol light absorption coefficient	N/A	t	t	5
23	Visibility Distance	N/A	t	t	7
25	Wind Speed	m/s	t	t	8
21	Present Weather Flag	N/A	t	t	7
22	Present Weather Code	N/A	t	t	7
26	Ambient Pressure	N/A	t	t	9
27	Ambient Temperature	N/A	t	t	9
28	Ambient Relative Humidity	N/A	t	t	9
29	Solar Radiation	N/A	t	t	9
30	Wind Direction	Deg	t	t	9
31	Precipitation Rate	N/A	t	t	9
32	Wind Speed	N/A	t	t	9
33	Wind Gust Speed	N/A	t	t	9
16	Ambient Temperature	C	t	t	7
24	Wind Direction	Deg	t	t	8
\.


--
-- Data for Name: process; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.process (id, name, status, "Sensor id") FROM stdin;
176	ccn_process	DISCONNECTED	1
177	hygrometer_process	DISCONNECTED	2
178	uv_lif_process	DISCONNECTED	3
179	dma_process	DISCONNECTED	4
180	cpd3_process	INITIATING	6
\.


--
-- Data for Name: sensor; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor (id, name, acronym, "data table", available, "Process") FROM stdin;
2	Tunable Diode Laser Hygrometer	TDLH	sensor_hygrometer	t	hygrometer_process
1	Cloud Condensation Nuclei Counter	CCN	sensor_ccn	t	ccn_process
5	Light Absorption Photometer	CLAP	sensor_cpd3_clap	t	clap_process
3	Ultraviolet Laser Induced Fluorescence Sensor	UV-LIF	sensor_uv_lif	t	uv_lif_process
4	Differential mobility analyzers	DMA	sensor_dma	t	dma_process
8	Vaisala WMT	V-WMT	sensor_cpd3_wmt_vaisala	t	\N
7	Vaisala PWD	V-PWD	sensor_cpd3_pwd_vaisala	t	\N
9	Vaisala WXT	V-WXT	sensor_cpd3_wxt_vaisala	t	\N
0	Inlet Switcher	ISW	inlet_switcher_state	f	\N
6	CPD3	CPD3	\N	t	cpd3_process
\.


--
-- Data for Name: sensor_ccn; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_ccn ("Datetime", "Super Saturation", "Column Temperature Stabilized", "Delta T", "T1 Set", "T1 Read", "T2 Set", "T2 Read", "T3 Set", "T3 Read", "Naftion Set", "T Naftion", "Inlet Set", "T Inlet", "OCP Set", "T OCP", "T Sample", "Sample Flow Rate", "Sheath Flow Rate", "Sample Pressure", "Laser Current", "Overflow", "Baseline Monitor", "First Stage Monitor", "Bin", "Bin 1", "Bin 2", "Bin 3", "Bin 4", "Bin 5", "Bin 6", "Bin 7", "Bin 8", "Bin 9", "Bin 10", "Bin 11", "Bin 12", "Bin 13", "Bin 14", "Bin 15", "Bin 16", "Bin 17", "Bin 18", "Bin 19", "Bin 20", "Number Concentration", "Valve Set", "Alarm Code", "Alarm Sum", "CMD", "GMD") FROM stdin;
\.


--
-- Data for Name: sensor_cpd3_clap; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_cpd3_clap ("Datetime", "Transmittance", "Aerosol light absorption coefficient", "Transmittance B") FROM stdin;
\.


--
-- Data for Name: sensor_cpd3_cpc; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_cpd3_cpc ("Datetime", "Condensation nuclei concentration") FROM stdin;
\.


--
-- Data for Name: sensor_cpd3_neph; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_cpd3_neph ("Datetime", "Aerosol light scattering coefficient") FROM stdin;
\.


--
-- Data for Name: sensor_cpd3_pwd_vaisala; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_cpd3_pwd_vaisala ("Datetime", "Ambient Temperature", "Precipitation Rate", "Present Weather Flag", "Present Weather Code", "Visibility Distance") FROM stdin;
\.


--
-- Data for Name: sensor_cpd3_wmt_vaisala; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_cpd3_wmt_vaisala ("Datetime", "Wind Direction", "Wind Speed") FROM stdin;
\.


--
-- Data for Name: sensor_cpd3_wxt_vaisala; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_cpd3_wxt_vaisala ("Datetime", "Ambient Pressure", "Ambient Temperature", "Ambient Relative Humidity", "Solar Radiation", "Wind Direction", "Precipitation Rate", "Wind Speed", "Wind Gust Speed") FROM stdin;
\.


--
-- Data for Name: sensor_dma; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_dma ("Datetime", "Start Datetime", "End Datetime", "Scan Direction", "Sheath Sample Pressure", "Sheath Temp", "Sheath Average", "Sheath Standard Deviation", "Sheath RH", colsamp_avg, colsamp_sdec, colsame_rh, colsamp_temp, "CPC A Flow Average", "CPC A Standard Deviation", sat_temp, cond_temp, "SEMS Errors", "MCPC Errors", "Impactor Press", "Bin Diameter 1", "Bin Diameter 2", "Bin Diameter 3", "Bin Diameter 4", "Bin Diameter 5", "Bin Diameter 6", "Bin Diameter 7", "Bin Diameter 8", "Bin Diameter 9", "Bin Diameter 10", "Bin Diameter 11", "Bin Diameter 12", "Bin Diameter 13", "Bin Diameter 14", "Bin Diameter 15", "Bin Diameter 16", "Bin Diameter 17", "Bin Diameter 18", "Bin Diameter 19", "Bin Diameter 20", "Bin Diameter 21", "Bin Diameter 22", "Bin Diameter 23", "Bin Diameter 24", "Bin Diameter 25", "Bin Diameter 26", "Bin Diameter 27", "Bin Diameter 28", "Bin Diameter 29", "Bin Diameter 30", "Bin Diameter 31", "Bin Diameter 32", "Bin Diameter 33", "Bin Diameter 34", "Bin Diameter 35", "Bin Diameter 36", "Bin Diameter 37", "Bin Diameter 38", "Bin Diameter 39", "Bin Diameter 40", "Bin Diameter 41", "Bin Diameter 42", "Bin Diameter 43", "Bin Diameter 44", "Bin Diameter 45", "Bin Diameter 46", "Bin Diameter 47", "Bin Diameter 48", "Bin Diameter 49", "Bin Diameter 50", "Bin Diameter 51", "Bin Diameter 52", "Bin Diameter 53", "Bin Diameter 54", "Bin Diameter 55", "Bin Diameter 56", "Bin Diameter 57", "Bin Diameter 58", "Bin Diameter 59", "Bin Diameter 60", "Bin Constant 1", "Bin Constant 2", "Bin Constant 3", "Bin Constant 4", "Bin Constant 5", "Bin Constant 6", "Bin Constant 7", "Bin Constant 8", "Bin Constant 9", "Bin Constant 10", "Bin Constant 11", "Bin Constant 12", "Bin Constant 13", "Bin Constant 14", "Bin Constant 15", "Bin Constant 16", "Bin Constant 17", "Bin Constant 18", "Bin Constant 19", "Bin Constant 20", "Bin Constant 21", "Bin Constant 22", "Bin Constant 23", "Bin Constant 24", "Bin Constant 25", "Bin Constant 26", "Bin Constant 27", "Bin Constant 28", "Bin Constant 29", "Bin Constant 30", "Bin Constant 31", "Bin Constant 32", "Bin Constant 33", "Bin Constant 34", "Bin Constant 35", "Bin Constant 36", "Bin Constant 37", "Bin Constant 38", "Bin Constant 39", "Bin Constant 40", "Bin Constant 41", "Bin Constant 42", "Bin Constant 43", "Bin Constant 44", "Bin Constant 45", "Bin Constant 46", "Bin Constant 47", "Bin Constant 48", "Bin Constant 49", "Bin Constant 50", "Bin Constant 51", "Bin Constant 52", "Bin Constant 53", "Bin Constant 54", "Bin Constant 55", "Bin Constant 56", "Bin Constant 57", "Bin Constant 58", "Bin Constant 59", "Bin Constant 60") FROM stdin;
\.


--
-- Data for Name: sensor_hygrometer; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_hygrometer ("Datetime", "Water Vapor Content", "Water Vapor Pressure", "Water Vapor Temperature") FROM stdin;
\.


--
-- Data for Name: sensor_log; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_log (id, datetime, log_type, log, "Sensor id") FROM stdin;
608	2020-11-23 20:20:52.655+00	INFO	Establishing CPD3 connection	6
609	2020-11-23 20:21:50.184+00	ERROR	CPD3 is not connected.	6
610	2020-11-23 20:22:12.206+00	INFO	Establishing CPD3 connection	6
611	2020-11-23 20:22:35.704+00	ERROR	CPD3 is not connected.	6
612	2020-11-23 20:23:07.588+00	INFO	Establishing CPD3 connection	6
613	2020-11-23 20:23:07.588+00	INFO	Establishing CPD3 connection	6
614	2020-11-23 20:23:53.621+00	ERROR	CPD3 is not connected.	6
615	2020-11-23 20:23:53.621+00	ERROR	CPD3 is not connected.	6
616	2020-11-24 01:49:47.651+00	INFO	Establishing CPD3 connection	6
617	2020-11-24 01:49:48.996+00	INFO	CPD3 is connected.	6
618	2020-12-01 14:28:26.743+00	INFO	Establishing CPD3 connection	6
619	2020-12-01 14:28:28.098+00	INFO	CPD3 is connected.	6
620	2020-12-01 14:32:49.795+00	INFO	Establishing CPD3 connection	6
621	2020-12-01 14:32:51.134+00	INFO	CPD3 is connected.	6
622	2020-12-01 14:39:28.888+00	ERROR	Please wait a minute, CPD3 is turning on.	6
623	2020-12-01 14:39:37.469+00	INFO	Establishing CPD3 connection	6
624	2020-12-01 14:39:38.864+00	INFO	CPD3 is connected.	6
625	2020-12-01 14:40:03.302+00	INFO	Establishing CPD3 connection	6
626	2020-12-01 14:40:03.302+00	INFO	Establishing CPD3 connection	6
627	2020-12-01 14:40:05.882+00	INFO	CPD3 is connected.	6
628	2020-12-01 14:40:05.882+00	INFO	CPD3 is connected.	6
629	2020-12-01 14:42:31.868+00	INFO	Establishing CPD3 connection	6
630	2020-12-01 14:42:31.868+00	INFO	Establishing CPD3 connection	6
631	2020-12-01 14:42:31.868+00	INFO	Establishing CPD3 connection	6
632	2020-12-01 14:42:35.663+00	INFO	CPD3 is connected.	6
633	2020-12-01 14:42:35.663+00	INFO	CPD3 is connected.	6
634	2020-12-01 14:42:35.663+00	INFO	CPD3 is connected.	6
635	2020-12-01 14:44:15.446+00	INFO	Establishing CPD3 connection	6
636	2020-12-01 14:44:16.798+00	INFO	CPD3 is connected.	6
637	2020-12-01 14:48:50.286+00	INFO	Establishing CPD3 connection	6
638	2020-12-01 14:48:51.671+00	INFO	CPD3 is connected.	6
639	2020-12-01 14:50:23.693+00	INFO	Establishing CPD3 connection	6
640	2020-12-01 14:50:25.058+00	INFO	CPD3 is connected.	6
641	2020-12-01 14:52:14.983+00	INFO	Establishing CPD3 connection	6
642	2020-12-01 14:52:16.358+00	INFO	CPD3 is connected.	6
643	2020-12-01 14:52:59.901+00	INFO	Establishing CPD3 connection	6
644	2020-12-01 14:53:01.247+00	INFO	CPD3 is connected.	6
645	2020-12-01 14:54:27.461+00	INFO	Establishing CCN connection...	1
646	2020-12-01 14:54:28.746+00	INFO	Searching for ccn directory...	1
647	2020-12-01 14:54:29.961+00	ERROR	CCN network path not found.	1
648	2020-12-01 14:54:40.697+00	INFO	Establishing CCN connection...	1
649	2020-12-01 14:54:41.963+00	INFO	Searching for ccn directory...	1
650	2020-12-01 14:54:43.191+00	ERROR	CCN network path not found.	1
651	2020-12-01 14:54:53.98+00	INFO	Establishing CCN connection...	1
652	2020-12-01 14:54:55.257+00	INFO	Searching for ccn directory...	1
653	2020-12-01 14:54:56.469+00	ERROR	CCN network path not found.	1
654	2020-12-01 14:55:34.117+00	INFO	Establishing CCN connection...	1
655	2020-12-01 14:55:35.398+00	INFO	Searching for ccn directory...	1
656	2020-12-01 14:55:36.621+00	ERROR	CCN network path not found.	1
657	2020-12-01 14:55:45.374+00	INFO	Establishing CPD3 connection	6
658	2020-12-01 14:55:46.736+00	INFO	CPD3 is connected.	6
659	2020-12-01 14:57:27.95+00	INFO	Establishing CPD3 connection	6
660	2020-12-01 14:57:29.348+00	INFO	CPD3 is connected.	6
661	2020-12-01 14:58:13.595+00	INFO	Establishing CPD3 connection	6
662	2020-12-01 14:58:15.009+00	INFO	CPD3 is connected.	6
663	2020-12-01 15:11:38.428+00	INFO	Establishing CPD3 connection	6
664	2020-12-01 15:11:39.805+00	INFO	CPD3 is connected.	6
665	2020-12-01 15:28:50.63+00	INFO	Establishing CPD3 connection	6
666	2020-12-01 15:28:52.006+00	INFO	CPD3 is connected.	6
667	2020-12-01 15:30:36.673+00	INFO	Establishing CPD3 connection	6
668	2020-12-01 15:30:38.051+00	INFO	CPD3 is connected.	6
669	2020-12-01 16:31:17.012+00	INFO	Establishing CPD3 connection	6
670	2020-12-01 16:31:18.388+00	INFO	CPD3 is connected.	6
671	2020-12-01 20:07:12.019+00	INFO	Establishing CPD3 connection	6
672	2020-12-01 20:07:13.42+00	INFO	CPD3 is connected.	6
673	2020-12-01 20:07:41.234+00	INFO	Establishing CPD3 connection	6
674	2020-12-01 20:07:42.614+00	INFO	CPD3 is connected.	6
675	2020-12-01 20:34:29.598+00	INFO	Establishing CPD3 connection	6
676	2020-12-01 20:34:30.996+00	INFO	CPD3 is connected.	6
677	2020-12-01 20:35:29.209+00	INFO	Establishing CPD3 connection	6
678	2020-12-01 20:35:30.604+00	INFO	CPD3 is connected.	6
679	2020-12-01 20:36:29.249+00	INFO	Establishing CPD3 connection	6
680	2020-12-01 20:36:30.64+00	INFO	CPD3 is connected.	6
681	2020-12-01 20:40:28.065+00	INFO	Establishing CPD3 connection	6
682	2020-12-01 20:40:29.453+00	INFO	CPD3 is connected.	6
683	2020-12-01 20:41:29.236+00	INFO	Establishing CPD3 connection	6
684	2020-12-01 20:41:30.612+00	INFO	CPD3 is connected.	6
685	2020-12-01 23:32:50.796+00	INFO	Establishing CPD3 connection	6
686	2020-12-01 23:32:52.188+00	INFO	CPD3 is connected.	6
687	2020-12-01 23:34:58.638+00	INFO	Establishing CPD3 connection	6
688	2020-12-01 23:35:00.039+00	INFO	CPD3 is connected.	6
689	2020-12-02 17:24:18.378+00	INFO	Establishing CPD3 connection	6
690	2020-12-02 17:24:20.19+00	INFO	CPD3 is connected.	6
\.


--
-- Data for Name: sensor_uv_lif; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.sensor_uv_lif ("Datetime", "408 Board Temperature", bandwidths_0, bandwidths_1, bandwidths_2, bandwidths_3, baseline_0, baseline_1, baseline_2, baseline_3, clump_count, "Exited Particles Count[#/cm3]", "Total Particle Count [all][#/cm3]", h12310_temperature, max_transit_time_counts, min_transit_time_counts, missed_particle_count, num_discarted_particles, num_oversize_rejects, "Relative Humidity", "System Power", "Sample Mass Flow Rate [L/min]", "Sample Pressure", "Sample Flow Rate Set Point", "Sample Temperature", "Sample Flow Rate", "Sheath Sample Mass Flow[L/min]", "Sheath Sample Pressure", "Sheath Sample Flow Rate Set Point", "Sheath Sample Temperature", "Sheath Flow Rate", sizer_oversize_count, temperature, total_particle_count, total_trigger_count, valid_particle_count, xe1_power, xe2_power, "Asphericity", density_gcm3, ep_overflow_flag, flag_excited, mass_ug, nf_shape_0, nf_shape_1, nf_shape_2, nf_shape_3, nf_sizer_relative_peak, nf_sizer_transit_time_nsec, "Size of Particle[um]", "Xe1-A Fluorescence Peak", "Xe1-B Fluorescence Peak", "Xe2-A Fluorescence Peak", "Xe2-B Fluorescence Peak") FROM stdin;
\.


--
-- Data for Name: users_log; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.users_log (id, "Datetime", log_type, "Log", user_id) FROM stdin;
61	2020-11-24 04:41:14.734+00	INFO	Test log	1
62	2020-12-01 14:25:54.965+00	INFO	Test Log	1
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: yxgtrenpqxeffu
--

COPY public.users_profile (id, image, user_id) FROM stdin;
1	default.jpg	1
2	default.jpg	2
4	default.jpg	4
3	default.jpg	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.blog_post_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 43, true);


--
-- Name: primary_variables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.primary_variables_id_seq', 1, false);


--
-- Name: process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.process_id_seq', 180, true);


--
-- Name: sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.sensor_id_seq', 1, false);


--
-- Name: sensor_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.sensor_log_id_seq', 690, true);


--
-- Name: users_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.users_log_id_seq', 62, true);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yxgtrenpqxeffu
--

SELECT pg_catalog.setval('public.users_profile_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (sensor_id);


--
-- Name: inlet_switcher_state inlet_switcher_state_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.inlet_switcher_state
    ADD CONSTRAINT inlet_switcher_state_pkey PRIMARY KEY ("Datetime");


--
-- Name: primary_variables primary_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.primary_variables
    ADD CONSTRAINT primary_variables_pkey PRIMARY KEY (id);


--
-- Name: process process_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.process
    ADD CONSTRAINT process_pkey PRIMARY KEY (id);


--
-- Name: sensor_ccn sensor_ccn_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_ccn
    ADD CONSTRAINT sensor_ccn_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_cpd3_clap sensor_cpd3_clap_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_cpd3_clap
    ADD CONSTRAINT sensor_cpd3_clap_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_cpd3_cpc sensor_cpd3_cpc_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_cpd3_cpc
    ADD CONSTRAINT sensor_cpd3_cpc_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_cpd3_neph sensor_cpd3_neph_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_cpd3_neph
    ADD CONSTRAINT sensor_cpd3_neph_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_cpd3_pwd_vaisala sensor_cpd3_pwd_vaisala_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_cpd3_pwd_vaisala
    ADD CONSTRAINT sensor_cpd3_pwd_vaisala_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_cpd3_wmt_vaisala sensor_cpd3_wmt_vaisala_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_cpd3_wmt_vaisala
    ADD CONSTRAINT sensor_cpd3_wmt_vaisala_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_cpd3_wxt_vaisala sensor_cpd3_wxt_vaisala_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_cpd3_wxt_vaisala
    ADD CONSTRAINT sensor_cpd3_wxt_vaisala_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_dma sensor_dma_Datetime_Start Datetime_End Datetime_a9ac7ffd_uniq; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_dma
    ADD CONSTRAINT "sensor_dma_Datetime_Start Datetime_End Datetime_a9ac7ffd_uniq" UNIQUE ("Datetime", "Start Datetime", "End Datetime");


--
-- Name: sensor_dma sensor_dma_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_dma
    ADD CONSTRAINT sensor_dma_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_hygrometer sensor_hygrometer_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_hygrometer
    ADD CONSTRAINT sensor_hygrometer_pkey PRIMARY KEY ("Datetime");


--
-- Name: sensor_log sensor_log_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_log
    ADD CONSTRAINT sensor_log_pkey PRIMARY KEY (id);


--
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (id);


--
-- Name: sensor_uv_lif sensor_uv_lif_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_uv_lif
    ADD CONSTRAINT sensor_uv_lif_pkey PRIMARY KEY ("Datetime");


--
-- Name: users_log users_log_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_log
    ADD CONSTRAINT users_log_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_post_author_id_dd7a8485; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX blog_post_author_id_dd7a8485 ON public.blog_post USING btree (author_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: primary_variables_Sensor id_5bc7b170; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX "primary_variables_Sensor id_5bc7b170" ON public.primary_variables USING btree ("Sensor id");


--
-- Name: process_Sensor id_c4c3afbc; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX "process_Sensor id_c4c3afbc" ON public.process USING btree ("Sensor id");


--
-- Name: sensor_log_Sensor id_b851993d; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX "sensor_log_Sensor id_b851993d" ON public.sensor_log USING btree ("Sensor id");


--
-- Name: users_log_user_id_26c26178; Type: INDEX; Schema: public; Owner: yxgtrenpqxeffu
--

CREATE INDEX users_log_user_id_26c26178 ON public.users_log USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_author_id_dd7a8485_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: files files_sensor_id_a7f10c30_fk_sensor_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_sensor_id_a7f10c30_fk_sensor_id FOREIGN KEY (sensor_id) REFERENCES public.sensor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: primary_variables primary_variables_Sensor id_5bc7b170_fk_sensor_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.primary_variables
    ADD CONSTRAINT "primary_variables_Sensor id_5bc7b170_fk_sensor_id" FOREIGN KEY ("Sensor id") REFERENCES public.sensor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: process process_Sensor id_c4c3afbc_fk_sensor_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.process
    ADD CONSTRAINT "process_Sensor id_c4c3afbc_fk_sensor_id" FOREIGN KEY ("Sensor id") REFERENCES public.sensor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sensor_log sensor_log_Sensor id_b851993d_fk_sensor_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.sensor_log
    ADD CONSTRAINT "sensor_log_Sensor id_b851993d_fk_sensor_id" FOREIGN KEY ("Sensor id") REFERENCES public.sensor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_log users_log_user_id_26c26178_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_log
    ADD CONSTRAINT users_log_user_id_26c26178_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_user_id_2112e78d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: yxgtrenpqxeffu
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_2112e78d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DATABASE df9k3hectr2fe6; Type: ACL; Schema: -; Owner: yxgtrenpqxeffu
--

REVOKE CONNECT,TEMPORARY ON DATABASE df9k3hectr2fe6 FROM PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO yxgtrenpqxeffu;


--
-- PostgreSQL database dump complete
--

