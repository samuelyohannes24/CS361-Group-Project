PGDMP          
            }           assets    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    82591    assets    DATABASE     �   CREATE DATABASE assets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1258';
    DROP DATABASE assets;
                postgres    false            �            1259    82593    assets    TABLE     �  CREATE TABLE public.assets (
    id integer NOT NULL,
    asset_name character varying(255) NOT NULL,
    asset_type character varying(50),
    description text,
    CONSTRAINT assets_asset_type_check CHECK (((asset_type)::text = ANY ((ARRAY['Hardware'::character varying, 'Software'::character varying, 'Data'::character varying, 'People'::character varying, 'Process'::character varying])::text[])))
);
    DROP TABLE public.assets;
       public         heap    postgres    false            �            1259    82592    assets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.assets_id_seq;
       public          postgres    false    216            �           0    0    assets_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;
          public          postgres    false    215            P           2604    82596 	   assets id    DEFAULT     f   ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);
 8   ALTER TABLE public.assets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    82593    assets 
   TABLE DATA           I   COPY public.assets (id, asset_name, asset_type, description) FROM stdin;
    public          postgres    false    216   y       �           0    0    assets_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.assets_id_seq', 7, true);
          public          postgres    false    215            S           2606    82601    assets assets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_pkey;
       public            postgres    false    216            �   8  x�E��N�0���S�����!�Ҡ�]�x��EK��vA}{�nb�Ċ��g�ڽa�А���g����Fb�2��u�X��j1�KI1�E��o�S_�D�e9���К�h\0�����A���t�U붴����l&�5�I�)���z%�U��߹M��5ﯰF�*]����	f�0�!���T]�PK�"&�����A��U7݊��U驣�(gL3�5b�t���{��ư�܆�$�K�m�:�Q}�e�u����6�G���l��0y�w���Hb�guaG5�`_�<�T�^��+��0o�q     