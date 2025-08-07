--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: Agreement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Agreement" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "fileUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Agreement_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Agreement_id_seq" OWNED BY public."Agreement".id;


--
-- Name: Campus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Campus" (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    estado text,
    municipio text,
    calle text,
    numero text,
    "codigoPostal" text,
    telefono text
);


--
-- Name: Campus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Campus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Campus_id_seq" OWNED BY public."Campus".id;


--
-- Name: Career; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Career" (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    clave text
);


--
-- Name: Career_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Career_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Career_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Career_id_seq" OWNED BY public."Career".id;


--
-- Name: ClassSchedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ClassSchedule" (
    id integer NOT NULL,
    "subjectId" integer NOT NULL,
    "teacherId" integer NOT NULL,
    "groupId" integer NOT NULL,
    "startTime" text NOT NULL,
    "endTime" text NOT NULL,
    room text,
    "weekDayId" integer NOT NULL
);


--
-- Name: ClassSchedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ClassSchedule_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ClassSchedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ClassSchedule_id_seq" OWNED BY public."ClassSchedule".id;


--
-- Name: Departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Departamento" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: Departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Departamento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Departamento_id_seq" OWNED BY public."Departamento".id;


--
-- Name: Estatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Estatus" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: Estatus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Estatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Estatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Estatus_id_seq" OWNED BY public."Estatus".id;


--
-- Name: Genero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Genero" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: Genero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Genero_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Genero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Genero_id_seq" OWNED BY public."Genero".id;


--
-- Name: Grade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Grade" (
    id integer NOT NULL,
    "studentId" integer NOT NULL,
    "subjectId" integer NOT NULL,
    "groupId" integer NOT NULL,
    value double precision NOT NULL
);


--
-- Name: Grade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Grade_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Grade_id_seq" OWNED BY public."Grade".id;


--
-- Name: Group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Group" (
    id integer NOT NULL,
    name text NOT NULL,
    "semesterId" integer NOT NULL,
    "careerId" integer NOT NULL,
    "campusId" integer NOT NULL
);


--
-- Name: Group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Group_id_seq" OWNED BY public."Group".id;


--
-- Name: NewsPost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."NewsPost" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "imageUrl" text,
    category text,
    "isPublished" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "authorId" integer NOT NULL
);


--
-- Name: NewsPost_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."NewsPost_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: NewsPost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."NewsPost_id_seq" OWNED BY public."NewsPost".id;


--
-- Name: NivelAcademico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."NivelAcademico" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: NivelAcademico_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."NivelAcademico_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: NivelAcademico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."NivelAcademico_id_seq" OWNED BY public."NivelAcademico".id;


--
-- Name: Parentesco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Parentesco" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: Parentesco_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Parentesco_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Parentesco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Parentesco_id_seq" OWNED BY public."Parentesco".id;


--
-- Name: Permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Permission" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: Permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Permission_id_seq" OWNED BY public."Permission".id;


--
-- Name: Policy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Policy" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "fileUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Policy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Policy_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Policy_id_seq" OWNED BY public."Policy".id;


--
-- Name: Role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Role" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."RolePermission" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    "permissionId" integer NOT NULL
);


--
-- Name: RolePermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."RolePermission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: RolePermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."RolePermission_id_seq" OWNED BY public."RolePermission".id;


--
-- Name: Role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;


--
-- Name: Semester; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Semester" (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: Semester_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Semester_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Semester_id_seq" OWNED BY public."Semester".id;


--
-- Name: Staff; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Staff" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "campusId" integer NOT NULL,
    calle text,
    codigopostal text,
    colonia text,
    cveempleado text NOT NULL,
    "departamentoId" integer,
    email text,
    estado text,
    "estatusId" integer,
    "fechaNacimiento" timestamp(3) without time zone,
    "generoId" integer,
    municipio text,
    "nivelAcademicoId" integer,
    noexterior text,
    nointerior text,
    puesto text NOT NULL,
    telefono text
);


--
-- Name: Staff_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Staff_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Staff_id_seq" OWNED BY public."Staff".id;


--
-- Name: Student; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Student" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "groupId" integer,
    "campusId" integer NOT NULL,
    calle text,
    codigopostal text,
    colonia text,
    email text,
    estado text,
    "estatusId" integer,
    "fechaNacimiento" timestamp(3) without time zone,
    "generoId" integer,
    matricula text,
    municipio text,
    noexterior text,
    nointerior text,
    telefono text
);


--
-- Name: StudentTutor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StudentTutor" (
    id integer NOT NULL,
    "studentId" integer NOT NULL,
    "tutorId" integer NOT NULL,
    calle text,
    codigopostal text,
    colonia text,
    email text,
    estado text,
    "estatusId" integer,
    "fechaNacimiento" timestamp(3) without time zone,
    "generoId" integer,
    municipio text,
    noexterior text,
    nointerior text,
    "parentescoId" integer,
    telefono text
);


--
-- Name: StudentTutor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."StudentTutor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: StudentTutor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."StudentTutor_id_seq" OWNED BY public."StudentTutor".id;


--
-- Name: Student_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Student_id_seq" OWNED BY public."Student".id;


--
-- Name: Subject; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Subject" (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    "careerId" integer NOT NULL,
    "semesterId" integer NOT NULL
);


--
-- Name: Subject_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Subject_id_seq" OWNED BY public."Subject".id;


--
-- Name: SuggestionBoxEntry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SuggestionBoxEntry" (
    id integer NOT NULL,
    "userId" integer,
    "typeId" integer NOT NULL,
    "statusId" integer NOT NULL,
    anonymous boolean DEFAULT false NOT NULL,
    message text NOT NULL,
    response text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: SuggestionBoxEntry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."SuggestionBoxEntry_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SuggestionBoxEntry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."SuggestionBoxEntry_id_seq" OWNED BY public."SuggestionBoxEntry".id;


--
-- Name: SuggestionStatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SuggestionStatus" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: SuggestionStatus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."SuggestionStatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SuggestionStatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."SuggestionStatus_id_seq" OWNED BY public."SuggestionStatus".id;


--
-- Name: SuggestionType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SuggestionType" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: SuggestionType_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."SuggestionType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SuggestionType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."SuggestionType_id_seq" OWNED BY public."SuggestionType".id;


--
-- Name: SystemSetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SystemSetting" (
    id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    type text
);


--
-- Name: SystemSetting_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."SystemSetting_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SystemSetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."SystemSetting_id_seq" OWNED BY public."SystemSetting".id;


--
-- Name: Teacher; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Teacher" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "campusId" integer NOT NULL,
    calle text,
    codigopostal text,
    colonia text,
    cveempleado text NOT NULL,
    email text,
    estado text,
    "estatusId" integer,
    "fechaContratacion" timestamp(3) without time zone,
    "fechaNacimiento" timestamp(3) without time zone,
    "generoId" integer,
    municipio text,
    "nivelAcademicoId" integer,
    noexterior text,
    nointerior text,
    puesto text NOT NULL,
    telefono text
);


--
-- Name: Teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Teacher_id_seq" OWNED BY public."Teacher".id;


--
-- Name: TeachingAssignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TeachingAssignment" (
    id integer NOT NULL,
    "teacherId" integer NOT NULL,
    "subjectId" integer NOT NULL,
    "groupId" integer NOT NULL
);


--
-- Name: TeachingAssignment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."TeachingAssignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: TeachingAssignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."TeachingAssignment_id_seq" OWNED BY public."TeachingAssignment".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "roleId" integer,
    "profileImageUrl" text
);


--
-- Name: UserPermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."UserPermission" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "permissionId" integer NOT NULL
);


--
-- Name: UserPermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserPermission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserPermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserPermission_id_seq" OWNED BY public."UserPermission".id;


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: WeekDay; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."WeekDay" (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: WeekDay_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."WeekDay_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: WeekDay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."WeekDay_id_seq" OWNED BY public."WeekDay".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: Agreement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Agreement" ALTER COLUMN id SET DEFAULT nextval('public."Agreement_id_seq"'::regclass);


--
-- Name: Campus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campus" ALTER COLUMN id SET DEFAULT nextval('public."Campus_id_seq"'::regclass);


--
-- Name: Career id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Career" ALTER COLUMN id SET DEFAULT nextval('public."Career_id_seq"'::regclass);


--
-- Name: ClassSchedule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ClassSchedule" ALTER COLUMN id SET DEFAULT nextval('public."ClassSchedule_id_seq"'::regclass);


--
-- Name: Departamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departamento" ALTER COLUMN id SET DEFAULT nextval('public."Departamento_id_seq"'::regclass);


--
-- Name: Estatus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Estatus" ALTER COLUMN id SET DEFAULT nextval('public."Estatus_id_seq"'::regclass);


--
-- Name: Genero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Genero" ALTER COLUMN id SET DEFAULT nextval('public."Genero_id_seq"'::regclass);


--
-- Name: Grade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade" ALTER COLUMN id SET DEFAULT nextval('public."Grade_id_seq"'::regclass);


--
-- Name: Group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Group" ALTER COLUMN id SET DEFAULT nextval('public."Group_id_seq"'::regclass);


--
-- Name: NewsPost id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."NewsPost" ALTER COLUMN id SET DEFAULT nextval('public."NewsPost_id_seq"'::regclass);


--
-- Name: NivelAcademico id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."NivelAcademico" ALTER COLUMN id SET DEFAULT nextval('public."NivelAcademico_id_seq"'::regclass);


--
-- Name: Parentesco id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Parentesco" ALTER COLUMN id SET DEFAULT nextval('public."Parentesco_id_seq"'::regclass);


--
-- Name: Permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Permission" ALTER COLUMN id SET DEFAULT nextval('public."Permission_id_seq"'::regclass);


--
-- Name: Policy id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Policy" ALTER COLUMN id SET DEFAULT nextval('public."Policy_id_seq"'::regclass);


--
-- Name: Role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);


--
-- Name: RolePermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission" ALTER COLUMN id SET DEFAULT nextval('public."RolePermission_id_seq"'::regclass);


--
-- Name: Semester id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Semester" ALTER COLUMN id SET DEFAULT nextval('public."Semester_id_seq"'::regclass);


--
-- Name: Staff id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff" ALTER COLUMN id SET DEFAULT nextval('public."Staff_id_seq"'::regclass);


--
-- Name: Student id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student" ALTER COLUMN id SET DEFAULT nextval('public."Student_id_seq"'::regclass);


--
-- Name: StudentTutor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor" ALTER COLUMN id SET DEFAULT nextval('public."StudentTutor_id_seq"'::regclass);


--
-- Name: Subject id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subject" ALTER COLUMN id SET DEFAULT nextval('public."Subject_id_seq"'::regclass);


--
-- Name: SuggestionBoxEntry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionBoxEntry" ALTER COLUMN id SET DEFAULT nextval('public."SuggestionBoxEntry_id_seq"'::regclass);


--
-- Name: SuggestionStatus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionStatus" ALTER COLUMN id SET DEFAULT nextval('public."SuggestionStatus_id_seq"'::regclass);


--
-- Name: SuggestionType id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionType" ALTER COLUMN id SET DEFAULT nextval('public."SuggestionType_id_seq"'::regclass);


--
-- Name: SystemSetting id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SystemSetting" ALTER COLUMN id SET DEFAULT nextval('public."SystemSetting_id_seq"'::regclass);


--
-- Name: Teacher id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher" ALTER COLUMN id SET DEFAULT nextval('public."Teacher_id_seq"'::regclass);


--
-- Name: TeachingAssignment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TeachingAssignment" ALTER COLUMN id SET DEFAULT nextval('public."TeachingAssignment_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: UserPermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserPermission" ALTER COLUMN id SET DEFAULT nextval('public."UserPermission_id_seq"'::regclass);


--
-- Name: WeekDay id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeekDay" ALTER COLUMN id SET DEFAULT nextval('public."WeekDay_id_seq"'::regclass);


--
-- Data for Name: Agreement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Agreement" (id, title, description, "fileUrl", "createdAt") FROM stdin;
\.


--
-- Data for Name: Campus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Campus" (id, name, description, estado, municipio, calle, numero, "codigoPostal", telefono) FROM stdin;
2	PLANTEL FRESNILLO	PLANTEL FRESNILLO	ZACATECAS	FRESNILLO	PALOMAR	715	N/A	492-123-4567
3	MAZAPIL	MAZAPIL	ZACATECAS	MAZAPIL	S/R	S/N	N/A	492-123-4567
1	PLANTEL MAESTRA DOLORES CASTRO VARELA	PLANTEL MAESTRA DOLORES CASTRO VARELA	ZACATECAS	GUADALUPE	AV MEXICO	10	A	492-123-4567
4	DIRECCIÓN GENERAL	DIRECCIÓN GENERAL	ZACATECAS	GUADALUPE	AV MEXICO	10	\N	\N
\.


--
-- Data for Name: Career; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Career" (id, name, description, clave) FROM stdin;
1	PT-B en Administracion	PT-B en Administracion	ADMO18
2	PT-B en Maquinas Herramienta	PT-B en Maquinas Herramienta	MAHE18
3	PT-B en Alimentos y Bebidas	PT-B en Alimentos y Bebidas	ALBE18
4	PT-B en Autotronica	PT-B en Autotronica	ATRO18
5	PT-B en Contabilidad	PT-B en Contabilidad	CONA18
6	PT-B en Electromecanica Industrial	PT-B en Electromecanica Industrial	EMEC18
7	PT-B en Motores a Diesel	PT-B en Motores a Diesel	MODI18
8	PT-B en Seguridad e Higiene y Protección Civil	PT-B en Seguridad e Higiene y Protección Civil	SHPC18
\.


--
-- Data for Name: ClassSchedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ClassSchedule" (id, "subjectId", "teacherId", "groupId", "startTime", "endTime", room, "weekDayId") FROM stdin;
\.


--
-- Data for Name: Departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Departamento" (id, name, description) FROM stdin;
\.


--
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Estatus" (id, name, description) FROM stdin;
\.


--
-- Data for Name: Genero; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Genero" (id, name, description) FROM stdin;
\.


--
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Grade" (id, "studentId", "subjectId", "groupId", value) FROM stdin;
\.


--
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Group" (id, name, "semesterId", "careerId", "campusId") FROM stdin;
1	1101	1	1	1
\.


--
-- Data for Name: NewsPost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."NewsPost" (id, title, description, "imageUrl", category, "isPublished", "createdAt", "updatedAt", "authorId") FROM stdin;
\.


--
-- Data for Name: NivelAcademico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."NivelAcademico" (id, name, description) FROM stdin;
\.


--
-- Data for Name: Parentesco; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Parentesco" (id, name, description) FROM stdin;
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Permission" (id, name, description) FROM stdin;
1	FULL_CONTROL	FULL_CONTROL
2	MANAGE_USERS	MANAGE_USERS
3	PUBLISH_POSTS	PUBLISH_POSTS
4	ACCESS_HORARIOS	ACCESS_HORARIOS
5	ACCESS_BUZON	ACCESS_BUZON
6	ACCESS_ACADEMIA	ACCESS_ACADEMIA
7	ACCESS_CALIFICACIONES	ACCESS_CALIFICACIONES
8	ACCESS_CONFIGURACION	ACCESS_CONFIGURACION
9	ACCESS_NORMATIVAS	ACCESS_NORMATIVAS
10	ACCESS_CONVENIOS	ACCESS_CONVENIOS
\.


--
-- Data for Name: Policy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Policy" (id, title, description, "fileUrl", "createdAt") FROM stdin;
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Role" (id, name, description) FROM stdin;
1	Estudiante	Estudiante
2	Tutor	Tutor
3	Docente	Docente
4	Administrativo	Administrativo
\.


--
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."RolePermission" (id, "roleId", "permissionId") FROM stdin;
\.


--
-- Data for Name: Semester; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Semester" (id, name) FROM stdin;
1	Primer Semestre
2	Segundo Semestre
3	Tercer Semestre
4	Cuarto Semestre
5	Quinto Semestre
6	Sexto Semestre
\.


--
-- Data for Name: Staff; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Staff" (id, "userId", "campusId", calle, codigopostal, colonia, cveempleado, "departamentoId", email, estado, "estatusId", "fechaNacimiento", "generoId", municipio, "nivelAcademicoId", noexterior, nointerior, puesto, telefono) FROM stdin;
1	7	4	\N	\N	\N	0200994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MANDO MEDIO	\N
\.


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Student" (id, "userId", "groupId", "campusId", calle, codigopostal, colonia, email, estado, "estatusId", "fechaNacimiento", "generoId", matricula, municipio, noexterior, nointerior, telefono) FROM stdin;
1	6	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: StudentTutor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StudentTutor" (id, "studentId", "tutorId", calle, codigopostal, colonia, email, estado, "estatusId", "fechaNacimiento", "generoId", municipio, noexterior, nointerior, "parentescoId", telefono) FROM stdin;
\.


--
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Subject" (id, name, description, "careerId", "semesterId") FROM stdin;
1	Manejo de espacios y cantidades	Manejo de espacios y cantidades	1	1
2	Interacción inicial en inglés	Interacción inicial en inglés	1	1
3	Análisis de la materia y la energía	Análisis de la materia y la energía	1	1
4	Comunicación para la interacción social	Comunicación para la interacción social	1	1
5	Procesamiento de información por medios digitales	Procesamiento de información por medios digitales	1	1
6	Proyección personal y profesional	Proyección personal y profesional	1	1
7	Resolución de problemas	Resolución de problemas	1	1
8	Autogestión del aprendizaje	Autogestión del aprendizaje	1	1
\.


--
-- Data for Name: SuggestionBoxEntry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SuggestionBoxEntry" (id, "userId", "typeId", "statusId", anonymous, message, response, "createdAt") FROM stdin;
\.


--
-- Data for Name: SuggestionStatus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SuggestionStatus" (id, name, description) FROM stdin;
\.


--
-- Data for Name: SuggestionType; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SuggestionType" (id, name, description) FROM stdin;
\.


--
-- Data for Name: SystemSetting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SystemSetting" (id, key, value, type) FROM stdin;
\.


--
-- Data for Name: Teacher; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Teacher" (id, "userId", "campusId", calle, codigopostal, colonia, cveempleado, email, estado, "estatusId", "fechaContratacion", "fechaNacimiento", "generoId", municipio, "nivelAcademicoId", noexterior, nointerior, puesto, telefono) FROM stdin;
\.


--
-- Data for Name: TeachingAssignment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."TeachingAssignment" (id, "teacherId", "subjectId", "groupId") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."User" (id, name, email, password, "createdAt", "roleId", "profileImageUrl") FROM stdin;
1	Luis Alberto Montejo Garcia	lmontejog@zac.conalep.edu.mx	123456	2025-07-29 22:57:34.075	4	\N
3	Christian Josue Duron Medina	cduronm@zac.conalep.edu.mx	123456	2025-07-29 22:57:34.075	2	\N
4	Lilia Garcia Murillo	lgarciam@zac.conalep.edu.mx	$2b$10$l/tuw10q2RPGUf6s4GLKHeYc044CtfRIZJsaloU20q0LQaeru6kka	2025-07-30 05:24:16.433	3	\N
5	Omar Ali Montejo Garcia	omontejog@zac.conalep.edu.mx	$2b$10$T9dYLRmD3LbiGqLGSXstxu.Lk3pT1SCy/8g/VU.wISSvn7jyMAXTW	2025-07-30 05:26:16.786	1	\N
6	Ana Teresa Montejo Garcia	amontejog@zac.conalep.edu.mx	$2b$10$ZPtic0idhSEWR/KVfhmbYOVmHswAywlPSseudJnQdNYzo3BS7suhu	2025-07-30 05:33:37.027	1	http://192.168.100.58:4000/uploads/profileImage-1754587312122-446806392.jpeg
7	Hector Alejandro Gonzalez Lopez	agonzalez@zac.conalep.edu.mx	$2b$10$31r9LZBOHdCButjiZtA6h.xD9BIritxN5sTSvnNU6l2N1gUMCRS.2	2025-08-04 19:15:33.983	4	http://192.168.100.58:4000/uploads/profileImage-1754587377757-582270878.jpeg
\.


--
-- Data for Name: UserPermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."UserPermission" (id, "userId", "permissionId") FROM stdin;
\.


--
-- Data for Name: WeekDay; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WeekDay" (id, name) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
40741634-e9c9-4a87-b78b-51f99f7c552d	61c13700487251ba7ed39460c673506c30278f16fd23d1f203efc69c5b7df573	2025-07-29 22:02:20.32714-06	20250730040220_init	\N	\N	2025-07-29 22:02:20.31878-06	1
19e445b3-67d8-46fe-871c-0e72bed7394a	372b079fb96f306449f8f5daad513b290fa19a76404ab03c742c2f918f2e1901	2025-08-02 16:09:05.089872-06	20250802220905_add_roles_semesters_careers	\N	\N	2025-08-02 16:09:05.064646-06	1
ce3b62a1-26ae-4270-b60d-219e5d03f4cd	5ae0ae7763660a3c9d44e42ee1bf3332570fc097b64b9c4a210b2f73ce1c73c4	2025-08-02 16:10:59.26911-06	20250802221059_modificacion_roles	\N	\N	2025-08-02 16:10:59.266293-06	1
0056588c-265d-4154-aac3-118b9337b03e	f5296c36ae62c0b45b7f4b358e09d90444e4d1799a7b2f04a0351e890f6f7991	2025-08-02 16:19:47.056647-06	20250802221947_modificacion_semestres	\N	\N	2025-08-02 16:19:47.053796-06	1
d96fdc4d-9bc3-4680-8ef1-c967b53eafe6	0c84a5b0ca79a58c085bf7cdf389d72f964f3de0197990843c36559e13072d3a	2025-08-02 16:40:59.189329-06	20250802224059_nuevas_tablas	\N	\N	2025-08-02 16:40:59.176553-06	1
3b80d800-2e93-4e52-b6ed-ccf0137553c2	2efbde0602fe1989fc8a4dc52c77f1aad1637f5ea6861fe4b13fa0d57c0717c0	2025-08-02 16:47:31.253518-06	20250802224731_add_user_permissions	\N	\N	2025-08-02 16:47:31.24421-06	1
c3c7a85c-5f60-43a5-81dd-c9e548236435	11f1527c2bbbaebcf2aa7b58b5c58da8894a96fd40e2e6dfe44fea5e48f18d68	2025-08-06 11:11:19.557738-06	20250806171119_modificacion_tablas	\N	\N	2025-08-06 11:11:19.484991-06	1
01b3d8f2-fe71-413d-a642-113818d90b4c	353e268d85a5642ee43fcaafd6abb83e4c594f7129da378ea69e5dba753f4fc4	2025-08-06 11:55:27.915757-06	20250806175527_modificacion_carrer	\N	\N	2025-08-06 11:55:27.910134-06	1
cf8c5368-4032-46bb-ab92-98c5e6602c5a	1e165b1513e32c602fcea2b9d3aad2fba59e66b8bb23f58d5f916b77538a4796	2025-08-06 13:15:23.352728-06	20250806191523_adscripciones	\N	\N	2025-08-06 13:15:23.343306-06	1
99122c13-583c-453b-bdab-f3b2cb59427a	60b490d774b3d958f33d52d98fbc3bfdf61d981d5fad38bb440960f2e7d1dba4	2025-08-06 13:53:33.31647-06	20250806195333_actualizaciones	\N	\N	2025-08-06 13:53:33.308374-06	1
10156fd8-dded-467a-b7e1-b984c8d41415	2ff51a487f9928e398b304c0a8b2b2390200bb522ac119ab3334bbc275e92847	2025-08-06 15:41:08.044263-06	20250806214108_imgperfil	\N	\N	2025-08-06 15:41:08.041461-06	1
b3048652-d6f5-4fa8-95a6-8ffacc474190	30931b6cf2ce938c1f6db3a27713a9cef2f77377f7955af0da403ac5e439bf06	2025-08-07 13:14:29.498457-06	20250807191429_campos_personales	\N	\N	2025-08-07 13:14:29.454537-06	1
\.


--
-- Name: Agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Agreement_id_seq"', 1, false);


--
-- Name: Campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Campus_id_seq"', 3, true);


--
-- Name: Career_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Career_id_seq"', 16, true);


--
-- Name: ClassSchedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ClassSchedule_id_seq"', 1, false);


--
-- Name: Departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Departamento_id_seq"', 1, false);


--
-- Name: Estatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Estatus_id_seq"', 1, false);


--
-- Name: Genero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Genero_id_seq"', 1, false);


--
-- Name: Grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Grade_id_seq"', 1, false);


--
-- Name: Group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Group_id_seq"', 1, true);


--
-- Name: NewsPost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."NewsPost_id_seq"', 1, false);


--
-- Name: NivelAcademico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."NivelAcademico_id_seq"', 1, false);


--
-- Name: Parentesco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Parentesco_id_seq"', 1, false);


--
-- Name: Permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Permission_id_seq"', 1, false);


--
-- Name: Policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Policy_id_seq"', 1, false);


--
-- Name: RolePermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."RolePermission_id_seq"', 1, false);


--
-- Name: Role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Role_id_seq"', 1, false);


--
-- Name: Semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Semester_id_seq"', 6, true);


--
-- Name: Staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Staff_id_seq"', 1, true);


--
-- Name: StudentTutor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."StudentTutor_id_seq"', 1, false);


--
-- Name: Student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Student_id_seq"', 1, true);


--
-- Name: Subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Subject_id_seq"', 8, true);


--
-- Name: SuggestionBoxEntry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."SuggestionBoxEntry_id_seq"', 1, false);


--
-- Name: SuggestionStatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."SuggestionStatus_id_seq"', 1, false);


--
-- Name: SuggestionType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."SuggestionType_id_seq"', 1, false);


--
-- Name: SystemSetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."SystemSetting_id_seq"', 1, false);


--
-- Name: Teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Teacher_id_seq"', 1, false);


--
-- Name: TeachingAssignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."TeachingAssignment_id_seq"', 1, false);


--
-- Name: UserPermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."UserPermission_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 7, true);


--
-- Name: WeekDay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."WeekDay_id_seq"', 1, false);


--
-- Name: Agreement Agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Agreement"
    ADD CONSTRAINT "Agreement_pkey" PRIMARY KEY (id);


--
-- Name: Campus Campus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Campus"
    ADD CONSTRAINT "Campus_pkey" PRIMARY KEY (id);


--
-- Name: Career Career_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Career"
    ADD CONSTRAINT "Career_pkey" PRIMARY KEY (id);


--
-- Name: ClassSchedule ClassSchedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ClassSchedule"
    ADD CONSTRAINT "ClassSchedule_pkey" PRIMARY KEY (id);


--
-- Name: Departamento Departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Departamento"
    ADD CONSTRAINT "Departamento_pkey" PRIMARY KEY (id);


--
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY (id);


--
-- Name: Genero Genero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Genero"
    ADD CONSTRAINT "Genero_pkey" PRIMARY KEY (id);


--
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (id);


--
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (id);


--
-- Name: NewsPost NewsPost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."NewsPost"
    ADD CONSTRAINT "NewsPost_pkey" PRIMARY KEY (id);


--
-- Name: NivelAcademico NivelAcademico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."NivelAcademico"
    ADD CONSTRAINT "NivelAcademico_pkey" PRIMARY KEY (id);


--
-- Name: Parentesco Parentesco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Parentesco"
    ADD CONSTRAINT "Parentesco_pkey" PRIMARY KEY (id);


--
-- Name: Permission Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);


--
-- Name: Policy Policy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Policy"
    ADD CONSTRAINT "Policy_pkey" PRIMARY KEY (id);


--
-- Name: RolePermission RolePermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY (id);


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: Semester Semester_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Semester"
    ADD CONSTRAINT "Semester_pkey" PRIMARY KEY (id);


--
-- Name: Staff Staff_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_pkey" PRIMARY KEY (id);


--
-- Name: StudentTutor StudentTutor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor"
    ADD CONSTRAINT "StudentTutor_pkey" PRIMARY KEY (id);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);


--
-- Name: SuggestionBoxEntry SuggestionBoxEntry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionBoxEntry"
    ADD CONSTRAINT "SuggestionBoxEntry_pkey" PRIMARY KEY (id);


--
-- Name: SuggestionStatus SuggestionStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionStatus"
    ADD CONSTRAINT "SuggestionStatus_pkey" PRIMARY KEY (id);


--
-- Name: SuggestionType SuggestionType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionType"
    ADD CONSTRAINT "SuggestionType_pkey" PRIMARY KEY (id);


--
-- Name: SystemSetting SystemSetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SystemSetting"
    ADD CONSTRAINT "SystemSetting_pkey" PRIMARY KEY (id);


--
-- Name: Teacher Teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY (id);


--
-- Name: TeachingAssignment TeachingAssignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TeachingAssignment"
    ADD CONSTRAINT "TeachingAssignment_pkey" PRIMARY KEY (id);


--
-- Name: UserPermission UserPermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserPermission"
    ADD CONSTRAINT "UserPermission_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: WeekDay WeekDay_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."WeekDay"
    ADD CONSTRAINT "WeekDay_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Campus_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Campus_name_key" ON public."Campus" USING btree (name);


--
-- Name: Career_clave_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Career_clave_key" ON public."Career" USING btree (clave);


--
-- Name: Career_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Career_name_key" ON public."Career" USING btree (name);


--
-- Name: Departamento_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Departamento_name_key" ON public."Departamento" USING btree (name);


--
-- Name: Estatus_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Estatus_name_key" ON public."Estatus" USING btree (name);


--
-- Name: Genero_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Genero_name_key" ON public."Genero" USING btree (name);


--
-- Name: Grade_studentId_subjectId_groupId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Grade_studentId_subjectId_groupId_key" ON public."Grade" USING btree ("studentId", "subjectId", "groupId");


--
-- Name: NivelAcademico_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "NivelAcademico_name_key" ON public."NivelAcademico" USING btree (name);


--
-- Name: Parentesco_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Parentesco_name_key" ON public."Parentesco" USING btree (name);


--
-- Name: Permission_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Permission_name_key" ON public."Permission" USING btree (name);


--
-- Name: RolePermission_roleId_permissionId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "RolePermission_roleId_permissionId_key" ON public."RolePermission" USING btree ("roleId", "permissionId");


--
-- Name: Role_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Role_name_key" ON public."Role" USING btree (name);


--
-- Name: Semester_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Semester_name_key" ON public."Semester" USING btree (name);


--
-- Name: Staff_cveempleado_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Staff_cveempleado_key" ON public."Staff" USING btree (cveempleado);


--
-- Name: Staff_userId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Staff_userId_key" ON public."Staff" USING btree ("userId");


--
-- Name: StudentTutor_studentId_tutorId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "StudentTutor_studentId_tutorId_key" ON public."StudentTutor" USING btree ("studentId", "tutorId");


--
-- Name: Student_matricula_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Student_matricula_key" ON public."Student" USING btree (matricula);


--
-- Name: Student_userId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Student_userId_key" ON public."Student" USING btree ("userId");


--
-- Name: SuggestionStatus_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "SuggestionStatus_name_key" ON public."SuggestionStatus" USING btree (name);


--
-- Name: SuggestionType_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "SuggestionType_name_key" ON public."SuggestionType" USING btree (name);


--
-- Name: SystemSetting_key_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "SystemSetting_key_key" ON public."SystemSetting" USING btree (key);


--
-- Name: Teacher_cveempleado_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Teacher_cveempleado_key" ON public."Teacher" USING btree (cveempleado);


--
-- Name: Teacher_userId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Teacher_userId_key" ON public."Teacher" USING btree ("userId");


--
-- Name: TeachingAssignment_teacherId_subjectId_groupId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "TeachingAssignment_teacherId_subjectId_groupId_key" ON public."TeachingAssignment" USING btree ("teacherId", "subjectId", "groupId");


--
-- Name: UserPermission_userId_permissionId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UserPermission_userId_permissionId_key" ON public."UserPermission" USING btree ("userId", "permissionId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: WeekDay_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "WeekDay_name_key" ON public."WeekDay" USING btree (name);


--
-- Name: ClassSchedule ClassSchedule_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ClassSchedule"
    ADD CONSTRAINT "ClassSchedule_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ClassSchedule ClassSchedule_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ClassSchedule"
    ADD CONSTRAINT "ClassSchedule_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ClassSchedule ClassSchedule_teacherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ClassSchedule"
    ADD CONSTRAINT "ClassSchedule_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ClassSchedule ClassSchedule_weekDayId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ClassSchedule"
    ADD CONSTRAINT "ClassSchedule_weekDayId_fkey" FOREIGN KEY ("weekDayId") REFERENCES public."WeekDay"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Grade Grade_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Grade Grade_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Grade Grade_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Group Group_campusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES public."Campus"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Group Group_careerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_careerId_fkey" FOREIGN KEY ("careerId") REFERENCES public."Career"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Group Group_semesterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_semesterId_fkey" FOREIGN KEY ("semesterId") REFERENCES public."Semester"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: NewsPost NewsPost_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."NewsPost"
    ADD CONSTRAINT "NewsPost_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RolePermission RolePermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RolePermission RolePermission_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Staff Staff_campusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES public."Campus"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Staff Staff_departamentoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_departamentoId_fkey" FOREIGN KEY ("departamentoId") REFERENCES public."Departamento"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Staff Staff_estatusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES public."Estatus"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Staff Staff_generoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES public."Genero"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Staff Staff_nivelAcademicoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_nivelAcademicoId_fkey" FOREIGN KEY ("nivelAcademicoId") REFERENCES public."NivelAcademico"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Staff Staff_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: StudentTutor StudentTutor_estatusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor"
    ADD CONSTRAINT "StudentTutor_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES public."Estatus"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: StudentTutor StudentTutor_generoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor"
    ADD CONSTRAINT "StudentTutor_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES public."Genero"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: StudentTutor StudentTutor_parentescoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor"
    ADD CONSTRAINT "StudentTutor_parentescoId_fkey" FOREIGN KEY ("parentescoId") REFERENCES public."Parentesco"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: StudentTutor StudentTutor_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor"
    ADD CONSTRAINT "StudentTutor_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: StudentTutor StudentTutor_tutorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudentTutor"
    ADD CONSTRAINT "StudentTutor_tutorId_fkey" FOREIGN KEY ("tutorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_campusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES public."Campus"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_estatusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES public."Estatus"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Student Student_generoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES public."Genero"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Student Student_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Student Student_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Subject Subject_careerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_careerId_fkey" FOREIGN KEY ("careerId") REFERENCES public."Career"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Subject Subject_semesterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_semesterId_fkey" FOREIGN KEY ("semesterId") REFERENCES public."Semester"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SuggestionBoxEntry SuggestionBoxEntry_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionBoxEntry"
    ADD CONSTRAINT "SuggestionBoxEntry_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public."SuggestionStatus"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SuggestionBoxEntry SuggestionBoxEntry_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionBoxEntry"
    ADD CONSTRAINT "SuggestionBoxEntry_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."SuggestionType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SuggestionBoxEntry SuggestionBoxEntry_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SuggestionBoxEntry"
    ADD CONSTRAINT "SuggestionBoxEntry_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Teacher Teacher_campusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES public."Campus"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Teacher Teacher_estatusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES public."Estatus"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Teacher Teacher_generoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES public."Genero"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Teacher Teacher_nivelAcademicoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_nivelAcademicoId_fkey" FOREIGN KEY ("nivelAcademicoId") REFERENCES public."NivelAcademico"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Teacher Teacher_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TeachingAssignment TeachingAssignment_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TeachingAssignment"
    ADD CONSTRAINT "TeachingAssignment_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TeachingAssignment TeachingAssignment_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TeachingAssignment"
    ADD CONSTRAINT "TeachingAssignment_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TeachingAssignment TeachingAssignment_teacherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TeachingAssignment"
    ADD CONSTRAINT "TeachingAssignment_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserPermission UserPermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserPermission"
    ADD CONSTRAINT "UserPermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserPermission UserPermission_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."UserPermission"
    ADD CONSTRAINT "UserPermission_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: User User_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

