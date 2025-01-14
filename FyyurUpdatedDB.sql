PGDMP     7    8                 y            fyyur    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16597    fyyur    DATABASE     i   CREATE DATABASE fyyur WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE fyyur;
                postgres    false            �            1259    16709    Artist    TABLE       CREATE TABLE public."Artist" (
    id integer NOT NULL,
    name character varying,
    city character varying(120),
    state character varying(120),
    phone character varying(120),
    image_link character varying(500),
    facebook_link character varying(120),
    seeking_venue boolean,
    website character varying(120),
    past_shows_count integer,
    upcoming_shows_count integer,
    seeking_description character varying(2000),
    address character varying(120),
    genres character varying(200)[]
);
    DROP TABLE public."Artist";
       public         heap    postgres    false            �            1259    16707    Artist_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Artist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Artist_id_seq";
       public          postgres    false    203            �           0    0    Artist_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Artist_id_seq" OWNED BY public."Artist".id;
          public          postgres    false    202            �            1259    16720    Show    TABLE     �   CREATE TABLE public."Show" (
    id integer NOT NULL,
    venue_id integer,
    artist_id integer,
    start_time timestamp without time zone,
    artist_image_link character varying(2000)
);
    DROP TABLE public."Show";
       public         heap    postgres    false            �            1259    16718    Show_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Show_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Show_id_seq";
       public          postgres    false    205            �           0    0    Show_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Show_id_seq" OWNED BY public."Show".id;
          public          postgres    false    204            �            1259    16693    Venue    TABLE       CREATE TABLE public."Venue" (
    id integer NOT NULL,
    name character varying,
    city character varying(120),
    state character varying(120),
    address character varying(120),
    phone character varying(120),
    image_link character varying(500),
    facebook_link character varying(120),
    website character varying(120),
    past_shows_count integer,
    upcoming_shows_count integer,
    seeking_description character varying(2000),
    seeking_talent boolean,
    genres character varying(200)[]
);
    DROP TABLE public."Venue";
       public         heap    postgres    false            �            1259    16691    Venue_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Venue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Venue_id_seq";
       public          postgres    false    201            �           0    0    Venue_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Venue_id_seq" OWNED BY public."Venue".id;
          public          postgres    false    200            �            1259    16799    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            6           2604    16712 	   Artist id    DEFAULT     j   ALTER TABLE ONLY public."Artist" ALTER COLUMN id SET DEFAULT nextval('public."Artist_id_seq"'::regclass);
 :   ALTER TABLE public."Artist" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            7           2604    16723    Show id    DEFAULT     f   ALTER TABLE ONLY public."Show" ALTER COLUMN id SET DEFAULT nextval('public."Show_id_seq"'::regclass);
 8   ALTER TABLE public."Show" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            5           2604    16696    Venue id    DEFAULT     h   ALTER TABLE ONLY public."Venue" ALTER COLUMN id SET DEFAULT nextval('public."Venue_id_seq"'::regclass);
 9   ALTER TABLE public."Venue" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �          0    16709    Artist 
   TABLE DATA           �   COPY public."Artist" (id, name, city, state, phone, image_link, facebook_link, seeking_venue, website, past_shows_count, upcoming_shows_count, seeking_description, address, genres) FROM stdin;
    public          postgres    false    203   #       �          0    16720    Show 
   TABLE DATA           X   COPY public."Show" (id, venue_id, artist_id, start_time, artist_image_link) FROM stdin;
    public          postgres    false    205   %&       �          0    16693    Venue 
   TABLE DATA           �   COPY public."Venue" (id, name, city, state, address, phone, image_link, facebook_link, website, past_shows_count, upcoming_shows_count, seeking_description, seeking_talent, genres) FROM stdin;
    public          postgres    false    201   f'       �          0    16799    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    206   �*       �           0    0    Artist_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Artist_id_seq"', 23, true);
          public          postgres    false    202            �           0    0    Show_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Show_id_seq"', 11, true);
          public          postgres    false    204            �           0    0    Venue_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Venue_id_seq"', 31, true);
          public          postgres    false    200            ;           2606    16717    Artist Artist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Artist"
    ADD CONSTRAINT "Artist_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Artist" DROP CONSTRAINT "Artist_pkey";
       public            postgres    false    203            =           2606    16725    Show Show_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Show" DROP CONSTRAINT "Show_pkey";
       public            postgres    false    205            9           2606    16701    Venue Venue_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Venue"
    ADD CONSTRAINT "Venue_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Venue" DROP CONSTRAINT "Venue_pkey";
       public            postgres    false    201            ?           2606    16803 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    206            A           2606    16731    Show Show_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_artist_id_fkey" FOREIGN KEY (artist_id) REFERENCES public."Artist"(id);
 F   ALTER TABLE ONLY public."Show" DROP CONSTRAINT "Show_artist_id_fkey";
       public          postgres    false    203    2875    205            @           2606    16726    Show Show_venue_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES public."Venue"(id);
 E   ALTER TABLE ONLY public."Show" DROP CONSTRAINT "Show_venue_id_fkey";
       public          postgres    false    2873    205    201            �   �  x��U]��:}v�y�S��3q�*����.��r�'q_R;�.ق���e�t����@r�Dvf�9sL08��\�
ٵ� &`.uo�<���;�x:�!�e�
k?ƥ]M��z��.t5�i�fc!2�����3c�&I�!��@��z-7�"�N���Ї�vm��m��f	k�C/[e���(&���l�|=h��M�tN���6��)��ʬ��n����q�N=˵q�S!�+���e]����b����	;(�x��>m��<�_$�O ��s��?���~��7�~sI| M����hwH&pn{�]{+���`+���� �z�dp�$�߻��k���F����B�sx�e�Q/M�]�cFID	�xx�W��J.�����Phs�q�94�2��:+e*XBT����V���pLb<��j�OS���+�⿧���*˵����J�q����m7fi�Ɵf�1�~p���(ț�C孆ya[{5'�r�	����~�|���g�\���c�MWI���fJ�(�4���Xf�44D�
Q����e�)B,�������C/Nn��5vp�[ة~�J�����[�1n`�+�h�~y�Uo�ן���2��zx�eq}� B	#4�Bw�]/������r�|n4��ER	�����0-�^k�Ju�H�0��Grw��ܮ��7�F�J�᫵��*j��l�,ށ��g_�����26�FE��:�%�u�Q�������,t�cl�aG�����!�F��~�      �   1  x���MK�@���W��ۦ��.ADP���K�iMlRl��i��K�����0;�
�Q�4�&\ ��T=]��f���}���u��Q�n�]��F1���ڒ50ǹ�����Y�ەƈ"�}S����ﮫ��yz�=<�.�vC�V�v�a�i�m��+e��3��b%3.۝�3N��-$z�0�)J���>6?>}��c�`4�9<�;gQW.�kb*c���gNq�_��w���5��7A��4M8#�A�>NѴ�Ds���xr�A!+w�Y�X�@�,�1*��p^�1���fz�5
��zO�      �   G  x�Օ]o�6���_q�_�2)R_��v�E��u��C�����3-*"e�+��G�n��#��]l�dX:�!�G�9"M��4�c�+�J���̸�>��uS���A���
����G�/�����66M��<K��^�7�߉��t�^<S�jmnk^	%�bS��"Ku���{�&}p��]�B��{;�q4>G��t�ϛb�����*��w����s��0��MFy�*Z��ɭ����D��f��׋���gí�QmʑY�J7���!{Y;a@������r%
k�����XYQܽ�r��i��%�Kg�1B0S���L0��	��ʕ��(_�lD�(JB�8�,���v�=¢0$~����.�}
�D��<������͘K^h^�K��;]���;�p,/R�������N����r�o���n��"S��AB�O�(�q�.��G%��j9 ���؉ݫUz6���������8K���z�dm���Ҏ�J��f�;z��]�l���$>�u����;�}�꺰��Y�]���+48wF���ԠӮԜ�
8�&iR�V6P�+i֎ۅ�n�x+08tx@|ʞ�.�8(��`��!]�(f�~�~��ռ��*���� ��4!D= }۟��Hg�.�k�g��߉VFo��p׳��&�	Js�%�<�ef�v�`�t����ڞ�Z��@�k��t.�կ�mW��ݵxxe��`58�;[Q��6!�ƃ��pC�����}���S�2Q��+��Gu~���̵}����~��gJ��҅L���{_���Ϯ] �R���J�����z��ߵy�i      �      x������ � �     