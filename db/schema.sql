PGDMP      /                }            threat_intelligence    16.3    16.3 #    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    82541    threat_intelligence    DATABASE     �   CREATE DATABASE threat_intelligence WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1258';
 #   DROP DATABASE threat_intelligence;
                postgres    false            �            1259    82543    assets    TABLE     �   CREATE TABLE public.assets (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(50),
    description text
);
    DROP TABLE public.assets;
       public         heap    postgres    false            �            1259    82542    assets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.assets_id_seq;
       public          postgres    false    216                       0    0    assets_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;
          public          postgres    false    215            �            1259    82578    risk_ratings    TABLE     �   CREATE TABLE public.risk_ratings (
    id integer NOT NULL,
    asset_id integer,
    overall_risk_level integer,
    CONSTRAINT risk_ratings_overall_risk_level_check CHECK (((overall_risk_level >= 1) AND (overall_risk_level <= 10)))
);
     DROP TABLE public.risk_ratings;
       public         heap    postgres    false            �            1259    82577    risk_ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.risk_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.risk_ratings_id_seq;
       public          postgres    false    222                       0    0    risk_ratings_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.risk_ratings_id_seq OWNED BY public.risk_ratings.id;
          public          postgres    false    221            �            1259    82552    threats    TABLE     �   CREATE TABLE public.threats (
    id integer NOT NULL,
    asset_id integer,
    threat_name character varying(255) NOT NULL,
    risk_level integer,
    CONSTRAINT threats_risk_level_check CHECK (((risk_level >= 1) AND (risk_level <= 10)))
);
    DROP TABLE public.threats;
       public         heap    postgres    false            �            1259    82551    threats_id_seq    SEQUENCE     �   CREATE SEQUENCE public.threats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.threats_id_seq;
       public          postgres    false    218                       0    0    threats_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.threats_id_seq OWNED BY public.threats.id;
          public          postgres    false    217            �            1259    82565    vulnerabilities    TABLE       CREATE TABLE public.vulnerabilities (
    id integer NOT NULL,
    asset_id integer,
    vulnerability_name character varying(255) NOT NULL,
    severity integer,
    CONSTRAINT vulnerabilities_severity_check CHECK (((severity >= 1) AND (severity <= 10)))
);
 #   DROP TABLE public.vulnerabilities;
       public         heap    postgres    false            �            1259    82564    vulnerabilities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vulnerabilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.vulnerabilities_id_seq;
       public          postgres    false    220                       0    0    vulnerabilities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.vulnerabilities_id_seq OWNED BY public.vulnerabilities.id;
          public          postgres    false    219            _           2604    82546 	   assets id    DEFAULT     f   ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);
 8   ALTER TABLE public.assets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            b           2604    82581    risk_ratings id    DEFAULT     r   ALTER TABLE ONLY public.risk_ratings ALTER COLUMN id SET DEFAULT nextval('public.risk_ratings_id_seq'::regclass);
 >   ALTER TABLE public.risk_ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            `           2604    82555 
   threats id    DEFAULT     h   ALTER TABLE ONLY public.threats ALTER COLUMN id SET DEFAULT nextval('public.threats_id_seq'::regclass);
 9   ALTER TABLE public.threats ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            a           2604    82568    vulnerabilities id    DEFAULT     x   ALTER TABLE ONLY public.vulnerabilities ALTER COLUMN id SET DEFAULT nextval('public.vulnerabilities_id_seq'::regclass);
 A   ALTER TABLE public.vulnerabilities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220                      0    82543    assets 
   TABLE DATA           A   COPY public.assets (id, name, category, description) FROM stdin;
    public          postgres    false    216   �'                 0    82578    risk_ratings 
   TABLE DATA           H   COPY public.risk_ratings (id, asset_id, overall_risk_level) FROM stdin;
    public          postgres    false    222   (                 0    82552    threats 
   TABLE DATA           H   COPY public.threats (id, asset_id, threat_name, risk_level) FROM stdin;
    public          postgres    false    218   (                 0    82565    vulnerabilities 
   TABLE DATA           U   COPY public.vulnerabilities (id, asset_id, vulnerability_name, severity) FROM stdin;
    public          postgres    false    220   ;(                  0    0    assets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.assets_id_seq', 1, false);
          public          postgres    false    215                       0    0    risk_ratings_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.risk_ratings_id_seq', 1, false);
          public          postgres    false    221                       0    0    threats_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.threats_id_seq', 1, false);
          public          postgres    false    217                       0    0    vulnerabilities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.vulnerabilities_id_seq', 1, false);
          public          postgres    false    219            g           2606    82550    assets assets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_pkey;
       public            postgres    false    216            m           2606    82584    risk_ratings risk_ratings_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.risk_ratings
    ADD CONSTRAINT risk_ratings_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.risk_ratings DROP CONSTRAINT risk_ratings_pkey;
       public            postgres    false    222            i           2606    82558    threats threats_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.threats
    ADD CONSTRAINT threats_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.threats DROP CONSTRAINT threats_pkey;
       public            postgres    false    218            k           2606    82571 $   vulnerabilities vulnerabilities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.vulnerabilities
    ADD CONSTRAINT vulnerabilities_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.vulnerabilities DROP CONSTRAINT vulnerabilities_pkey;
       public            postgres    false    220            p           2606    82585 '   risk_ratings risk_ratings_asset_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.risk_ratings
    ADD CONSTRAINT risk_ratings_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.risk_ratings DROP CONSTRAINT risk_ratings_asset_id_fkey;
       public          postgres    false    4711    222    216            n           2606    82559    threats threats_asset_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.threats
    ADD CONSTRAINT threats_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.threats DROP CONSTRAINT threats_asset_id_fkey;
       public          postgres    false    4711    216    218            o           2606    82572 -   vulnerabilities vulnerabilities_asset_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vulnerabilities
    ADD CONSTRAINT vulnerabilities_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.vulnerabilities DROP CONSTRAINT vulnerabilities_asset_id_fkey;
       public          postgres    false    216    220    4711                  x������ � �            x������ � �            x������ � �            x������ � �     