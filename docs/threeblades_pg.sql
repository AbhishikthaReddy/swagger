--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.7
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-12-20 12:01:48 EST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3266 (class 1262 OID 16389)
-- Name: threeblades; Type: DATABASE; Schema: -; Owner: threeblades
--

CREATE DATABASE threeblades WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE threeblades OWNER TO threeblades;

\connect threeblades

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12723)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 16775)
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 16395)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO threeblades;

--
-- TOC entry 202 (class 1259 OID 16650)
-- Name: audit_log; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE audit_log (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    action character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE audit_log OWNER TO threeblades;

--
-- TOC entry 201 (class 1259 OID 16648)
-- Name: audit_log_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audit_log_id_seq OWNER TO threeblades;

--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 201
-- Name: audit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE audit_log_id_seq OWNED BY audit_log.id;


--
-- TOC entry 204 (class 1259 OID 16664)
-- Name: billing_address; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE billing_address (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state_province character varying(100) NOT NULL,
    zip_code character varying(11) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE billing_address OWNER TO threeblades;

--
-- TOC entry 203 (class 1259 OID 16662)
-- Name: billing_address_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE billing_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE billing_address_id_seq OWNER TO threeblades;

--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 203
-- Name: billing_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE billing_address_id_seq OWNED BY billing_address.id;


--
-- TOC entry 206 (class 1259 OID 16675)
-- Name: billing_plan; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE billing_plan (
    id integer NOT NULL,
    name character varying(50),
    description character varying(400),
    settings json,
    cost numeric(6,2)
);


ALTER TABLE billing_plan OWNER TO threeblades;

--
-- TOC entry 205 (class 1259 OID 16673)
-- Name: billing_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE billing_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE billing_plan_id_seq OWNER TO threeblades;

--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 205
-- Name: billing_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE billing_plan_id_seq OWNED BY billing_plan.id;


--
-- TOC entry 223 (class 1259 OID 17311)
-- Name: data_source; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE data_source (
    server_id integer NOT NULL
);


ALTER TABLE data_source OWNER TO threeblades;

--
-- TOC entry 191 (class 1259 OID 16531)
-- Name: email; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE email (
    address character varying(255) NOT NULL,
    user_id integer,
    public boolean,
    unsubscribed boolean
);


ALTER TABLE email OWNER TO threeblades;

--
-- TOC entry 189 (class 1259 OID 16504)
-- Name: env_vars; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE env_vars (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL,
    project_id integer
);


ALTER TABLE env_vars OWNER TO threeblades;

--
-- TOC entry 188 (class 1259 OID 16502)
-- Name: env_vars_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE env_vars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE env_vars_id_seq OWNER TO threeblades;

--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 188
-- Name: env_vars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE env_vars_id_seq OWNED BY env_vars.id;


--
-- TOC entry 212 (class 1259 OID 16762)
-- Name: environment_resources; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE environment_resources (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    cpu integer NOT NULL,
    memory integer NOT NULL,
    description character varying(200),
    created_at timestamp without time zone,
    active boolean,
    storage_size integer
);


ALTER TABLE environment_resources OWNER TO threeblades;

--
-- TOC entry 211 (class 1259 OID 16760)
-- Name: environment_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE environment_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE environment_resources_id_seq OWNER TO threeblades;

--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 211
-- Name: environment_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE environment_resources_id_seq OWNED BY environment_resources.id;


--
-- TOC entry 193 (class 1259 OID 16543)
-- Name: environment_type; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE environment_type (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    image_name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    cmd character varying(512),
    description character varying(200),
    work_dir character varying(250),
    env_vars hstore,
    container_path character varying(250),
    container_port integer,
    active boolean DEFAULT true,
    urldoc character varying(200),
    type character varying(1),
    usage hstore
);


ALTER TABLE environment_type OWNER TO threeblades;

--
-- TOC entry 192 (class 1259 OID 16541)
-- Name: environment_type_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE environment_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE environment_type_id_seq OWNER TO threeblades;

--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 192
-- Name: environment_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE environment_type_id_seq OWNED BY environment_type.id;


--
-- TOC entry 200 (class 1259 OID 16633)
-- Name: followers; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE followers (
    followed_id integer NOT NULL,
    follower_id integer NOT NULL
);


ALTER TABLE followers OWNER TO threeblades;

--
-- TOC entry 187 (class 1259 OID 16496)
-- Name: group; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE "group" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    admin boolean,
    read_permission boolean,
    write_permission boolean
);


ALTER TABLE "group" OWNER TO threeblades;

--
-- TOC entry 186 (class 1259 OID 16494)
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_id_seq OWNER TO threeblades;

--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 186
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE group_id_seq OWNED BY "group".id;


--
-- TOC entry 208 (class 1259 OID 16710)
-- Name: integration; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE integration (
    id integer NOT NULL,
    integration_id character varying(64) NOT NULL,
    integration_email character varying(255) NOT NULL,
    user_id integer NOT NULL,
    scopes character varying(255)[],
    provider character varying(255) NOT NULL,
    settings json
);


ALTER TABLE integration OWNER TO threeblades;

--
-- TOC entry 207 (class 1259 OID 16708)
-- Name: integration_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE integration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE integration_id_seq OWNER TO threeblades;

--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 207
-- Name: integration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE integration_id_seq OWNED BY integration.id;


--
-- TOC entry 214 (class 1259 OID 16920)
-- Name: jobs; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE jobs (
    server_id integer NOT NULL,
    script character varying(255) NOT NULL,
    method character varying(50),
    auto_restart boolean,
    schedule character varying(20)
);


ALTER TABLE jobs OWNER TO threeblades;

--
-- TOC entry 213 (class 1259 OID 16907)
-- Name: models; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE models (
    server_id integer NOT NULL,
    script character varying(255) NOT NULL,
    method character varying(50)
);


ALTER TABLE models OWNER TO threeblades;

--
-- TOC entry 183 (class 1259 OID 16458)
-- Name: project; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE project (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(400),
    private boolean NOT NULL,
    last_updated timestamp without time zone
);


ALTER TABLE project OWNER TO threeblades;

--
-- TOC entry 182 (class 1259 OID 16456)
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_id_seq OWNER TO threeblades;

--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 182
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- TOC entry 184 (class 1259 OID 16464)
-- Name: project_server; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE project_server (
    project_id integer NOT NULL,
    server_id integer NOT NULL
);


ALTER TABLE project_server OWNER TO threeblades;

--
-- TOC entry 196 (class 1259 OID 16566)
-- Name: projects_teams; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE projects_teams (
    project_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE projects_teams OWNER TO threeblades;

--
-- TOC entry 185 (class 1259 OID 16479)
-- Name: projects_users; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE projects_users (
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    owner boolean
);


ALTER TABLE projects_users OWNER TO threeblades;

--
-- TOC entry 180 (class 1259 OID 16435)
-- Name: role; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE role (
    id integer NOT NULL,
    name character varying(80),
    description character varying(255)
);


ALTER TABLE role OWNER TO threeblades;

--
-- TOC entry 179 (class 1259 OID 16433)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO threeblades;

--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 179
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- TOC entry 181 (class 1259 OID 16443)
-- Name: roles_users; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE roles_users (
    user_id integer,
    role_id integer
);


ALTER TABLE roles_users OWNER TO threeblades;

--
-- TOC entry 224 (class 1259 OID 17321)
-- Name: server_data_sources; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE server_data_sources (
    server_id integer NOT NULL,
    data_source_id integer NOT NULL
);


ALTER TABLE server_data_sources OWNER TO threeblades;

--
-- TOC entry 217 (class 1259 OID 17115)
-- Name: server_run_statistics; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE server_run_statistics (
    id integer NOT NULL,
    server_id integer,
    start timestamp without time zone,
    stop timestamp without time zone,
    exit_code integer,
    size bigint,
    stacktrace text
);


ALTER TABLE server_run_statistics OWNER TO threeblades;

--
-- TOC entry 216 (class 1259 OID 17113)
-- Name: server_run_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE server_run_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE server_run_statistics_id_seq OWNER TO threeblades;

--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 216
-- Name: server_run_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE server_run_statistics_id_seq OWNED BY server_run_statistics.id;


--
-- TOC entry 222 (class 1259 OID 17267)
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE server_statistics (
    id integer NOT NULL,
    start timestamp without time zone,
    stop timestamp without time zone,
    size bigint,
    server_id integer
);


ALTER TABLE server_statistics OWNER TO threeblades;

--
-- TOC entry 221 (class 1259 OID 17265)
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE server_statistics_id_seq OWNER TO threeblades;

--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 221
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE server_statistics_id_seq OWNED BY server_statistics.id;


--
-- TOC entry 178 (class 1259 OID 16412)
-- Name: servers; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE servers (
    id integer NOT NULL,
    private_ip character varying(19) NOT NULL,
    public_ip character varying(19) NOT NULL,
    port integer NOT NULL,
    created_at timestamp without time zone,
    environment_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    container_id character varying(100),
    volume_path character varying(200) NOT NULL,
    environment_resources_id integer NOT NULL,
    type character varying(1),
    created_by_id integer,
    env_vars hstore,
    startup_script character varying(50)
);


ALTER TABLE servers OWNER TO threeblades;

--
-- TOC entry 177 (class 1259 OID 16410)
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE servers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE servers_id_seq OWNER TO threeblades;

--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 177
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE servers_id_seq OWNED BY servers.id;


--
-- TOC entry 219 (class 1259 OID 17200)
-- Name: ssh_tunnel; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE ssh_tunnel (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    host character varying(50) NOT NULL,
    local_port integer NOT NULL,
    endpoint character varying(50) NOT NULL,
    remote_port integer NOT NULL,
    username character varying(32) NOT NULL,
    server_id integer
);


ALTER TABLE ssh_tunnel OWNER TO threeblades;

--
-- TOC entry 218 (class 1259 OID 17198)
-- Name: ssh_tunnel_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE ssh_tunnel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ssh_tunnel_id_seq OWNER TO threeblades;

--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 218
-- Name: ssh_tunnel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE ssh_tunnel_id_seq OWNED BY ssh_tunnel.id;


--
-- TOC entry 210 (class 1259 OID 16731)
-- Name: synced_resource; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE synced_resource (
    id integer NOT NULL,
    project_id integer NOT NULL,
    integration_id integer NOT NULL,
    folder character varying(50) NOT NULL,
    url character varying(255) NOT NULL,
    settings json,
    last_sync timestamp without time zone,
    status character varying(10)
);


ALTER TABLE synced_resource OWNER TO threeblades;

--
-- TOC entry 209 (class 1259 OID 16729)
-- Name: synced_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE synced_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE synced_resource_id_seq OWNER TO threeblades;

--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 209
-- Name: synced_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE synced_resource_id_seq OWNED BY synced_resource.id;


--
-- TOC entry 195 (class 1259 OID 16551)
-- Name: team; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE team (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    email character varying(120) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by_id integer,
    avatar_url character varying(100),
    website character varying(200),
    last_updated timestamp without time zone,
    location character varying(120),
    description text,
    billing_email character varying(120),
    billing_address_id integer,
    billing_plan_id integer
);


ALTER TABLE team OWNER TO threeblades;

--
-- TOC entry 197 (class 1259 OID 16581)
-- Name: team_groups; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE team_groups (
    team_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE team_groups OWNER TO threeblades;

--
-- TOC entry 194 (class 1259 OID 16549)
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_id_seq OWNER TO threeblades;

--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 194
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- TOC entry 198 (class 1259 OID 16596)
-- Name: team_member; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE team_member (
    team_id integer NOT NULL,
    member_id integer NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE team_member OWNER TO threeblades;

--
-- TOC entry 199 (class 1259 OID 16618)
-- Name: team_watch; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE team_watch (
    team_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE team_watch OWNER TO threeblades;

--
-- TOC entry 220 (class 1259 OID 17233)
-- Name: token; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE token (
    key character varying(40) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE token OWNER TO threeblades;

--
-- TOC entry 176 (class 1259 OID 16400)
-- Name: user; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(120) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30),
    email character varying(120) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    avatar_url character varying(100),
    bio character varying(400),
    url character varying(200),
    last_updated timestamp without time zone,
    email_confirmed boolean,
    active boolean,
    password character varying(255) NOT NULL,
    confirmed_at timestamp without time zone,
    location character varying(120),
    company character varying(255),
    billing_address_id integer,
    billing_plan_id integer,
    current_login_at timestamp without time zone,
    current_login_ip character varying(20),
    last_login_at timestamp without time zone,
    last_login_ip character varying(20),
    login_count integer,
    "Timezone" character varying(20)
);


ALTER TABLE "user" OWNER TO threeblades;

--
-- TOC entry 190 (class 1259 OID 16518)
-- Name: user_groups; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE user_groups (
    user_id integer,
    group_id integer
);


ALTER TABLE user_groups OWNER TO threeblades;

--
-- TOC entry 175 (class 1259 OID 16398)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: threeblades
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO threeblades;

--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 175
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: threeblades
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 215 (class 1259 OID 17093)
-- Name: workspace; Type: TABLE; Schema: public; Owner: threeblades
--

CREATE TABLE workspace (
    server_id integer NOT NULL
);


ALTER TABLE workspace OWNER TO threeblades;

--
-- TOC entry 3028 (class 2604 OID 16653)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY audit_log ALTER COLUMN id SET DEFAULT nextval('audit_log_id_seq'::regclass);


--
-- TOC entry 3029 (class 2604 OID 16667)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY billing_address ALTER COLUMN id SET DEFAULT nextval('billing_address_id_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 16678)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY billing_plan ALTER COLUMN id SET DEFAULT nextval('billing_plan_id_seq'::regclass);


--
-- TOC entry 3024 (class 2604 OID 16507)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY env_vars ALTER COLUMN id SET DEFAULT nextval('env_vars_id_seq'::regclass);


--
-- TOC entry 3033 (class 2604 OID 16765)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY environment_resources ALTER COLUMN id SET DEFAULT nextval('environment_resources_id_seq'::regclass);


--
-- TOC entry 3025 (class 2604 OID 16546)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY environment_type ALTER COLUMN id SET DEFAULT nextval('environment_type_id_seq'::regclass);


--
-- TOC entry 3023 (class 2604 OID 16499)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY "group" ALTER COLUMN id SET DEFAULT nextval('group_id_seq'::regclass);


--
-- TOC entry 3031 (class 2604 OID 16713)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY integration ALTER COLUMN id SET DEFAULT nextval('integration_id_seq'::regclass);


--
-- TOC entry 3022 (class 2604 OID 16461)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- TOC entry 3021 (class 2604 OID 16438)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- TOC entry 3034 (class 2604 OID 17118)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_run_statistics ALTER COLUMN id SET DEFAULT nextval('server_run_statistics_id_seq'::regclass);


--
-- TOC entry 3036 (class 2604 OID 17270)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_statistics ALTER COLUMN id SET DEFAULT nextval('server_statistics_id_seq'::regclass);


--
-- TOC entry 3020 (class 2604 OID 16415)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY servers ALTER COLUMN id SET DEFAULT nextval('servers_id_seq'::regclass);


--
-- TOC entry 3035 (class 2604 OID 17203)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY ssh_tunnel ALTER COLUMN id SET DEFAULT nextval('ssh_tunnel_id_seq'::regclass);


--
-- TOC entry 3032 (class 2604 OID 16734)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY synced_resource ALTER COLUMN id SET DEFAULT nextval('synced_resource_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 16554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 16403)
-- Name: id; Type: DEFAULT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 3077 (class 2606 OID 16655)
-- Name: audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3080 (class 2606 OID 16672)
-- Name: billing_address_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY billing_address
    ADD CONSTRAINT billing_address_pkey PRIMARY KEY (id);


--
-- TOC entry 3082 (class 2606 OID 16683)
-- Name: billing_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY billing_plan
    ADD CONSTRAINT billing_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 17315)
-- Name: data_source_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY data_source
    ADD CONSTRAINT data_source_pkey PRIMARY KEY (server_id);


--
-- TOC entry 3058 (class 2606 OID 16535)
-- Name: email_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (address);


--
-- TOC entry 3056 (class 2606 OID 16512)
-- Name: env_vars_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY env_vars
    ADD CONSTRAINT env_vars_pkey PRIMARY KEY (id);


--
-- TOC entry 3088 (class 2606 OID 16769)
-- Name: environment_resources_name_key; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY environment_resources
    ADD CONSTRAINT environment_resources_name_key UNIQUE (name);


--
-- TOC entry 3090 (class 2606 OID 16767)
-- Name: environment_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY environment_resources
    ADD CONSTRAINT environment_resources_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 16617)
-- Name: environment_type_name_key; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY environment_type
    ADD CONSTRAINT environment_type_name_key UNIQUE (name);


--
-- TOC entry 3062 (class 2606 OID 16548)
-- Name: environment_type_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY environment_type
    ADD CONSTRAINT environment_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3075 (class 2606 OID 16637)
-- Name: followers_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (followed_id, follower_id);


--
-- TOC entry 3054 (class 2606 OID 16501)
-- Name: group_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- TOC entry 3084 (class 2606 OID 16718)
-- Name: integration_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY integration
    ADD CONSTRAINT integration_pkey PRIMARY KEY (id);


--
-- TOC entry 3094 (class 2606 OID 16927)
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (server_id);


--
-- TOC entry 3092 (class 2606 OID 16911)
-- Name: models_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (server_id);


--
-- TOC entry 3048 (class 2606 OID 16463)
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 16468)
-- Name: project_server_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY project_server
    ADD CONSTRAINT project_server_pkey PRIMARY KEY (project_id, server_id);


--
-- TOC entry 3067 (class 2606 OID 16570)
-- Name: projects_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY projects_teams
    ADD CONSTRAINT projects_teams_pkey PRIMARY KEY (project_id, team_id);


--
-- TOC entry 3052 (class 2606 OID 16483)
-- Name: projects_users_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY projects_users
    ADD CONSTRAINT projects_users_pkey PRIMARY KEY (project_id, user_id);


--
-- TOC entry 3044 (class 2606 OID 16442)
-- Name: role_name_key; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- TOC entry 3046 (class 2606 OID 16440)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3110 (class 2606 OID 17325)
-- Name: server_data_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_data_sources
    ADD CONSTRAINT server_data_sources_pkey PRIMARY KEY (server_id, data_source_id);


--
-- TOC entry 3098 (class 2606 OID 17120)
-- Name: server_run_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_run_statistics
    ADD CONSTRAINT server_run_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3106 (class 2606 OID 17272)
-- Name: server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3042 (class 2606 OID 16417)
-- Name: servers_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- TOC entry 3100 (class 2606 OID 17283)
-- Name: ssh_tunnel_name_server_id_key; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY ssh_tunnel
    ADD CONSTRAINT ssh_tunnel_name_server_id_key UNIQUE (name, server_id);


--
-- TOC entry 3102 (class 2606 OID 17205)
-- Name: ssh_tunnel_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY ssh_tunnel
    ADD CONSTRAINT ssh_tunnel_pkey PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 16739)
-- Name: synced_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY synced_resource
    ADD CONSTRAINT synced_resource_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 16585)
-- Name: team_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_groups
    ADD CONSTRAINT team_groups_pkey PRIMARY KEY (team_id, group_id);


--
-- TOC entry 3071 (class 2606 OID 16600)
-- Name: team_member_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_member
    ADD CONSTRAINT team_member_pkey PRIMARY KEY (team_id, member_id);


--
-- TOC entry 3065 (class 2606 OID 16559)
-- Name: team_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 16622)
-- Name: team_watch_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_watch
    ADD CONSTRAINT team_watch_pkey PRIMARY KEY (team_id, user_id);


--
-- TOC entry 3104 (class 2606 OID 17237)
-- Name: token_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY token
    ADD CONSTRAINT token_pkey PRIMARY KEY (key);


--
-- TOC entry 3040 (class 2606 OID 16408)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3096 (class 2606 OID 17097)
-- Name: workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_pkey PRIMARY KEY (server_id);


--
-- TOC entry 3078 (class 1259 OID 16661)
-- Name: ix_audit_log_action; Type: INDEX; Schema: public; Owner: threeblades
--

CREATE INDEX ix_audit_log_action ON audit_log USING btree (action);


--
-- TOC entry 3063 (class 1259 OID 16565)
-- Name: ix_team_name; Type: INDEX; Schema: public; Owner: threeblades
--

CREATE UNIQUE INDEX ix_team_name ON team USING btree (name);


--
-- TOC entry 3037 (class 1259 OID 17126)
-- Name: ix_user_email; Type: INDEX; Schema: public; Owner: threeblades
--

CREATE UNIQUE INDEX ix_user_email ON "user" USING btree (email);


--
-- TOC entry 3038 (class 1259 OID 16409)
-- Name: ix_user_username; Type: INDEX; Schema: public; Owner: threeblades
--

CREATE UNIQUE INDEX ix_user_username ON "user" USING btree (username);


--
-- TOC entry 3139 (class 2606 OID 16656)
-- Name: audit_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY audit_log
    ADD CONSTRAINT audit_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3150 (class 2606 OID 17316)
-- Name: data_source_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY data_source
    ADD CONSTRAINT data_source_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3125 (class 2606 OID 16536)
-- Name: email_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3122 (class 2606 OID 16513)
-- Name: env_vars_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY env_vars
    ADD CONSTRAINT env_vars_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- TOC entry 3137 (class 2606 OID 16638)
-- Name: followers_followed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY followers
    ADD CONSTRAINT followers_followed_id_fkey FOREIGN KEY (followed_id) REFERENCES "user"(id);


--
-- TOC entry 3138 (class 2606 OID 16643)
-- Name: followers_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY followers
    ADD CONSTRAINT followers_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES "user"(id);


--
-- TOC entry 3140 (class 2606 OID 16724)
-- Name: integration_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY integration
    ADD CONSTRAINT integration_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3144 (class 2606 OID 16928)
-- Name: jobs_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3143 (class 2606 OID 17103)
-- Name: models_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3118 (class 2606 OID 17083)
-- Name: project_server_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY project_server
    ADD CONSTRAINT project_server_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- TOC entry 3119 (class 2606 OID 17108)
-- Name: project_server_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY project_server
    ADD CONSTRAINT project_server_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3129 (class 2606 OID 16571)
-- Name: projects_teams_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY projects_teams
    ADD CONSTRAINT projects_teams_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- TOC entry 3130 (class 2606 OID 16576)
-- Name: projects_teams_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY projects_teams
    ADD CONSTRAINT projects_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- TOC entry 3120 (class 2606 OID 16484)
-- Name: projects_users_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY projects_users
    ADD CONSTRAINT projects_users_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- TOC entry 3121 (class 2606 OID 16489)
-- Name: projects_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY projects_users
    ADD CONSTRAINT projects_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3116 (class 2606 OID 16446)
-- Name: roles_users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3117 (class 2606 OID 16451)
-- Name: roles_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3151 (class 2606 OID 17326)
-- Name: server_data_sources_data_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_data_sources
    ADD CONSTRAINT server_data_sources_data_source_id_fkey FOREIGN KEY (data_source_id) REFERENCES data_source(server_id);


--
-- TOC entry 3152 (class 2606 OID 17331)
-- Name: server_data_sources_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_data_sources
    ADD CONSTRAINT server_data_sources_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3146 (class 2606 OID 17121)
-- Name: server_run_statistics_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_run_statistics
    ADD CONSTRAINT server_run_statistics_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3149 (class 2606 OID 17273)
-- Name: server_statistics_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY server_statistics
    ADD CONSTRAINT server_statistics_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3113 (class 2606 OID 17211)
-- Name: servers_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT servers_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES "user"(id);


--
-- TOC entry 3114 (class 2606 OID 17073)
-- Name: servers_environment_resources_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT servers_environment_resources_id_fkey FOREIGN KEY (environment_resources_id) REFERENCES environment_resources(id);


--
-- TOC entry 3115 (class 2606 OID 17078)
-- Name: servers_environment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT servers_environment_type_id_fkey FOREIGN KEY (environment_type_id) REFERENCES environment_type(id);


--
-- TOC entry 3147 (class 2606 OID 17206)
-- Name: ssh_tunnel_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY ssh_tunnel
    ADD CONSTRAINT ssh_tunnel_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3141 (class 2606 OID 16740)
-- Name: synced_resource_integration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY synced_resource
    ADD CONSTRAINT synced_resource_integration_id_fkey FOREIGN KEY (integration_id) REFERENCES integration(id);


--
-- TOC entry 3142 (class 2606 OID 16745)
-- Name: synced_resource_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY synced_resource
    ADD CONSTRAINT synced_resource_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- TOC entry 3127 (class 2606 OID 16694)
-- Name: team_billing_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES billing_address(id);


--
-- TOC entry 3128 (class 2606 OID 16699)
-- Name: team_billing_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_billing_plan_id_fkey FOREIGN KEY (billing_plan_id) REFERENCES billing_plan(id);


--
-- TOC entry 3126 (class 2606 OID 16560)
-- Name: team_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES "user"(id);


--
-- TOC entry 3131 (class 2606 OID 16586)
-- Name: team_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_groups
    ADD CONSTRAINT team_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- TOC entry 3132 (class 2606 OID 16591)
-- Name: team_groups_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_groups
    ADD CONSTRAINT team_groups_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- TOC entry 3133 (class 2606 OID 16601)
-- Name: team_member_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_member
    ADD CONSTRAINT team_member_member_id_fkey FOREIGN KEY (member_id) REFERENCES "user"(id);


--
-- TOC entry 3134 (class 2606 OID 16606)
-- Name: team_member_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_member
    ADD CONSTRAINT team_member_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- TOC entry 3135 (class 2606 OID 16623)
-- Name: team_watch_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_watch
    ADD CONSTRAINT team_watch_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- TOC entry 3136 (class 2606 OID 16628)
-- Name: team_watch_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY team_watch
    ADD CONSTRAINT team_watch_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3148 (class 2606 OID 17238)
-- Name: token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY token
    ADD CONSTRAINT token_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3112 (class 2606 OID 16689)
-- Name: user_billing_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES billing_address(id);


--
-- TOC entry 3111 (class 2606 OID 16684)
-- Name: user_billing_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_billing_plan_id_fkey FOREIGN KEY (billing_plan_id) REFERENCES billing_plan(id);


--
-- TOC entry 3123 (class 2606 OID 16521)
-- Name: user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- TOC entry 3124 (class 2606 OID 16526)
-- Name: user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 3145 (class 2606 OID 17098)
-- Name: workspace_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: threeblades
--

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_server_id_fkey FOREIGN KEY (server_id) REFERENCES servers(id);


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: threeblades
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM threeblades;
GRANT ALL ON SCHEMA public TO threeblades;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-12-20 12:02:44 EST

--
-- PostgreSQL database dump complete
--

