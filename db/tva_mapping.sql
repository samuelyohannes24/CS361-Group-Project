PGDMP  ,    )    
            }           assets    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    82591    assets    DATABASE     �   CREATE DATABASE assets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1258';
    DROP DATABASE assets;
                postgres    false            �            1259    82603    tva_mapping    TABLE     �  CREATE TABLE public.tva_mapping (
    id integer NOT NULL,
    asset_id integer,
    threat_name character varying(255),
    vulnerability_description text,
    likelihood integer,
    impact integer,
    risk_score integer GENERATED ALWAYS AS ((likelihood * impact)) STORED,
    CONSTRAINT tva_mapping_impact_check CHECK (((impact >= 1) AND (impact <= 5))),
    CONSTRAINT tva_mapping_likelihood_check CHECK (((likelihood >= 1) AND (likelihood <= 5)))
);
    DROP TABLE public.tva_mapping;
       public         heap    postgres    false            �            1259    82602    tva_mapping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tva_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tva_mapping_id_seq;
       public          postgres    false    218            �           0    0    tva_mapping_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tva_mapping_id_seq OWNED BY public.tva_mapping.id;
          public          postgres    false    217            S           2604    82606    tva_mapping id    DEFAULT     p   ALTER TABLE ONLY public.tva_mapping ALTER COLUMN id SET DEFAULT nextval('public.tva_mapping_id_seq'::regclass);
 =   ALTER TABLE public.tva_mapping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    82603    tva_mapping 
   TABLE DATA           o   COPY public.tva_mapping (id, asset_id, threat_name, vulnerability_description, likelihood, impact) FROM stdin;
    public          postgres    false    218   �       �           0    0    tva_mapping_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tva_mapping_id_seq', 5, true);
          public          postgres    false    217            X           2606    82613    tva_mapping tva_mapping_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tva_mapping
    ADD CONSTRAINT tva_mapping_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tva_mapping DROP CONSTRAINT tva_mapping_pkey;
       public            postgres    false    218            Y           2606    82614 %   tva_mapping tva_mapping_asset_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tva_mapping
    ADD CONSTRAINT tva_mapping_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);
 O   ALTER TABLE ONLY public.tva_mapping DROP CONSTRAINT tva_mapping_asset_id_fkey;
       public          postgres    false    218            �   e  x�u��N1D�ٯ�$�Di� 8 �Z	q��f��i6)��ҿ�) qᲊ��̼�U�
����w��%���2	��]5�Ҡ`4�����ć�b5�����}T&��EXv�0O��u���ӏ�	�-дK�H�n�1��_~�R�^@,�N���n����`@�Y���ڿ���z�=G���ҟ���H��}&;ٺ;�#��Jy��f�U��T�? � �#$Z�߄�Z��cl�3�[v}�t@�p�G������&߰3��gk�����/&'<���V�(�&5ZjE.�eX�)��={�>
ﬕq��;���8yP�e|Z��~�$�ӿ[jK���v�vo��� .�¸     