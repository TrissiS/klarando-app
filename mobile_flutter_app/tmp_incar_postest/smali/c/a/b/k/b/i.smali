.class public final Lc/a/b/k/b/i;
.super Ljava/lang/Object;
.source "ErrorCorrection.java"


# static fields
.field public static final a:[I

.field public static final b:[[I

.field public static final c:[I

.field public static final d:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 11

    const/16 v0, 0x10

    new-array v1, v0, [I

    .line 1
    fill-array-data v1, :array_ca

    sput-object v1, Lc/a/b/k/b/i;->a:[I

    new-array v0, v0, [[I

    const/4 v1, 0x5

    new-array v2, v1, [I

    .line 2
    fill-array-data v2, :array_ee

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const/4 v2, 0x7

    new-array v4, v2, [I

    fill-array-data v4, :array_fc

    const/4 v5, 0x1

    aput-object v4, v0, v5

    const/16 v4, 0xa

    new-array v6, v4, [I

    fill-array-data v6, :array_10e

    const/4 v7, 0x2

    aput-object v6, v0, v7

    const/16 v6, 0xb

    new-array v8, v6, [I

    fill-array-data v8, :array_126

    const/4 v9, 0x3

    aput-object v8, v0, v9

    const/16 v8, 0xc

    new-array v9, v8, [I

    fill-array-data v9, :array_140

    const/4 v10, 0x4

    aput-object v9, v0, v10

    const/16 v9, 0xe

    new-array v10, v9, [I

    fill-array-data v10, :array_15c

    aput-object v10, v0, v1

    const/16 v1, 0x12

    new-array v1, v1, [I

    fill-array-data v1, :array_17c

    const/4 v10, 0x6

    aput-object v1, v0, v10

    const/16 v1, 0x14

    new-array v1, v1, [I

    fill-array-data v1, :array_1a4

    aput-object v1, v0, v2

    const/16 v1, 0x18

    new-array v1, v1, [I

    fill-array-data v1, :array_1d0

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const/16 v1, 0x1c

    new-array v1, v1, [I

    fill-array-data v1, :array_204

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const/16 v1, 0x24

    new-array v1, v1, [I

    fill-array-data v1, :array_240

    aput-object v1, v0, v4

    const/16 v1, 0x2a

    new-array v1, v1, [I

    fill-array-data v1, :array_28c

    aput-object v1, v0, v6

    const/16 v1, 0x30

    new-array v1, v1, [I

    fill-array-data v1, :array_2e4

    aput-object v1, v0, v8

    const/16 v1, 0x38

    new-array v1, v1, [I

    fill-array-data v1, :array_348

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const/16 v1, 0x3e

    new-array v1, v1, [I

    fill-array-data v1, :array_3bc

    aput-object v1, v0, v9

    const/16 v1, 0x44

    new-array v1, v1, [I

    fill-array-data v1, :array_43c

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sput-object v0, Lc/a/b/k/b/i;->b:[[I

    const/16 v0, 0x100

    new-array v1, v0, [I

    .line 3
    sput-object v1, Lc/a/b/k/b/i;->c:[I

    const/16 v1, 0xff

    new-array v2, v1, [I

    .line 4
    sput-object v2, Lc/a/b/k/b/i;->d:[I

    :goto_b5
    if-ge v3, v1, :cond_c9

    .line 5
    sget-object v2, Lc/a/b/k/b/i;->d:[I

    aput v5, v2, v3

    .line 6
    sget-object v2, Lc/a/b/k/b/i;->c:[I

    aput v3, v2, v5

    mul-int/lit8 v5, v5, 0x2

    if-lt v5, v0, :cond_c6

    xor-int/lit16 v2, v5, 0x12d

    move v5, v2

    :cond_c6
    add-int/lit8 v3, v3, 0x1

    goto :goto_b5

    :cond_c9
    return-void

    :array_ca
    .array-data 4
        0x5
        0x7
        0xa
        0xb
        0xc
        0xe
        0x12
        0x14
        0x18
        0x1c
        0x24
        0x2a
        0x30
        0x38
        0x3e
        0x44
    .end array-data

    :array_ee
    .array-data 4
        0xe4
        0x30
        0xf
        0x6f
        0x3e
    .end array-data

    :array_fc
    .array-data 4
        0x17
        0x44
        0x90
        0x86
        0xf0
        0x5c
        0xfe
    .end array-data

    :array_10e
    .array-data 4
        0x1c
        0x18
        0xb9
        0xa6
        0xdf
        0xf8
        0x74
        0xff
        0x6e
        0x3d
    .end array-data

    :array_126
    .array-data 4
        0xaf
        0x8a
        0xcd
        0xc
        0xc2
        0xa8
        0x27
        0xf5
        0x3c
        0x61
        0x78
    .end array-data

    :array_140
    .array-data 4
        0x29
        0x99
        0x9e
        0x5b
        0x3d
        0x2a
        0x8e
        0xd5
        0x61
        0xb2
        0x64
        0xf2
    .end array-data

    :array_15c
    .array-data 4
        0x9c
        0x61
        0xc0
        0xfc
        0x5f
        0x9
        0x9d
        0x77
        0x8a
        0x2d
        0x12
        0xba
        0x53
        0xb9
    .end array-data

    :array_17c
    .array-data 4
        0x53
        0xc3
        0x64
        0x27
        0xbc
        0x4b
        0x42
        0x3d
        0xf1
        0xd5
        0x6d
        0x81
        0x5e
        0xfe
        0xe1
        0x30
        0x5a
        0xbc
    .end array-data

    :array_1a4
    .array-data 4
        0xf
        0xc3
        0xf4
        0x9
        0xe9
        0x47
        0xa8
        0x2
        0xbc
        0xa0
        0x99
        0x91
        0xfd
        0x4f
        0x6c
        0x52
        0x1b
        0xae
        0xba
        0xac
    .end array-data

    :array_1d0
    .array-data 4
        0x34
        0xbe
        0x58
        0xcd
        0x6d
        0x27
        0xb0
        0x15
        0x9b
        0xc5
        0xfb
        0xdf
        0x9b
        0x15
        0x5
        0xac
        0xfe
        0x7c
        0xc
        0xb5
        0xb8
        0x60
        0x32
        0xc1
    .end array-data

    :array_204
    .array-data 4
        0xd3
        0xe7
        0x2b
        0x61
        0x47
        0x60
        0x67
        0xae
        0x25
        0x97
        0xaa
        0x35
        0x4b
        0x22
        0xf9
        0x79
        0x11
        0x8a
        0x6e
        0xd5
        0x8d
        0x88
        0x78
        0x97
        0xe9
        0xa8
        0x5d
        0xff
    .end array-data

    :array_240
    .array-data 4
        0xf5
        0x7f
        0xf2
        0xda
        0x82
        0xfa
        0xa2
        0xb5
        0x66
        0x78
        0x54
        0xb3
        0xdc
        0xfb
        0x50
        0xb6
        0xe5
        0x12
        0x2
        0x4
        0x44
        0x21
        0x65
        0x89
        0x5f
        0x77
        0x73
        0x2c
        0xaf
        0xb8
        0x3b
        0x19
        0xe1
        0x62
        0x51
        0x70
    .end array-data

    :array_28c
    .array-data 4
        0x4d
        0xc1
        0x89
        0x1f
        0x13
        0x26
        0x16
        0x99
        0xf7
        0x69
        0x7a
        0x2
        0xf5
        0x85
        0xf2
        0x8
        0xaf
        0x5f
        0x64
        0x9
        0xa7
        0x69
        0xd6
        0x6f
        0x39
        0x79
        0x15
        0x1
        0xfd
        0x39
        0x36
        0x65
        0xf8
        0xca
        0x45
        0x32
        0x96
        0xb1
        0xe2
        0x5
        0x9
        0x5
    .end array-data

    :array_2e4
    .array-data 4
        0xf5
        0x84
        0xac
        0xdf
        0x60
        0x20
        0x75
        0x16
        0xee
        0x85
        0xee
        0xe7
        0xcd
        0xbc
        0xed
        0x57
        0xbf
        0x6a
        0x10
        0x93
        0x76
        0x17
        0x25
        0x5a
        0xaa
        0xcd
        0x83
        0x58
        0x78
        0x64
        0x42
        0x8a
        0xba
        0xf0
        0x52
        0x2c
        0xb0
        0x57
        0xbb
        0x93
        0xa0
        0xaf
        0x45
        0xd5
        0x5c
        0xfd
        0xe1
        0x13
    .end array-data

    :array_348
    .array-data 4
        0xaf
        0x9
        0xdf
        0xee
        0xc
        0x11
        0xdc
        0xd0
        0x64
        0x1d
        0xaf
        0xaa
        0xe6
        0xc0
        0xd7
        0xeb
        0x96
        0x9f
        0x24
        0xdf
        0x26
        0xc8
        0x84
        0x36
        0xe4
        0x92
        0xda
        0xea
        0x75
        0xcb
        0x1d
        0xe8
        0x90
        0xee
        0x16
        0x96
        0xc9
        0x75
        0x3e
        0xcf
        0xa4
        0xd
        0x89
        0xf5
        0x7f
        0x43
        0xf7
        0x1c
        0x9b
        0x2b
        0xcb
        0x6b
        0xe9
        0x35
        0x8f
        0x2e
    .end array-data

    :array_3bc
    .array-data 4
        0xf2
        0x5d
        0xa9
        0x32
        0x90
        0xd2
        0x27
        0x76
        0xca
        0xbc
        0xc9
        0xbd
        0x8f
        0x6c
        0xc4
        0x25
        0xb9
        0x70
        0x86
        0xe6
        0xf5
        0x3f
        0xc5
        0xbe
        0xfa
        0x6a
        0xb9
        0xdd
        0xaf
        0x40
        0x72
        0x47
        0xa1
        0x2c
        0x93
        0x6
        0x1b
        0xda
        0x33
        0x3f
        0x57
        0xa
        0x28
        0x82
        0xbc
        0x11
        0xa3
        0x1f
        0xb0
        0xaa
        0x4
        0x6b
        0xe8
        0x7
        0x5e
        0xa6
        0xe0
        0x7c
        0x56
        0x2f
        0xb
        0xcc
    .end array-data

    :array_43c
    .array-data 4
        0xdc
        0xe4
        0xad
        0x59
        0xfb
        0x95
        0x9f
        0x38
        0x59
        0x21
        0x93
        0xf4
        0x9a
        0x24
        0x49
        0x7f
        0xd5
        0x88
        0xf8
        0xb4
        0xea
        0xc5
        0x9e
        0xb1
        0x44
        0x7a
        0x5d
        0xd5
        0xf
        0xa0
        0xe3
        0xec
        0x42
        0x8b
        0x99
        0xb9
        0xca
        0xa7
        0xb3
        0x19
        0xdc
        0xe8
        0x60
        0xd2
        0xe7
        0x88
        0xdf
        0xef
        0xb5
        0xf1
        0x3b
        0x34
        0xac
        0x19
        0x31
        0xe8
        0xd3
        0xbd
        0x40
        0x36
        0x6c
        0x99
        0x84
        0x3f
        0x60
        0x67
        0x52
        0xba
    .end array-data
.end method

.method public static a(Ljava/lang/CharSequence;I)Ljava/lang/String;
    .registers 4

    .line 23
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Lc/a/b/k/b/i;->a(Ljava/lang/CharSequence;III)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/CharSequence;III)Ljava/lang/String;
    .registers 15

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 24
    :goto_2
    sget-object v2, Lc/a/b/k/b/i;->a:[I

    array-length v3, v2

    if-ge v1, v3, :cond_f

    .line 25
    aget v2, v2, v1

    if-ne v2, p3, :cond_c

    goto :goto_10

    :cond_c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_f
    const/4 v1, -0x1

    :goto_10
    if-ltz v1, :cond_89

    .line 26
    sget-object v2, Lc/a/b/k/b/i;->b:[[I

    aget-object v1, v2, v1

    .line 27
    new-array v2, p3, [C

    const/4 v3, 0x0

    :goto_19
    if-ge v3, p3, :cond_20

    .line 28
    aput-char v0, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_20
    move v3, p1

    :goto_21
    add-int v4, p1, p2

    if-ge v3, v4, :cond_75

    add-int/lit8 v4, p3, -0x1

    .line 29
    aget-char v5, v2, v4

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    xor-int/2addr v5, v6

    :goto_2e
    if-lez v4, :cond_57

    if-eqz v5, :cond_4e

    .line 30
    aget v6, v1, v4

    if-eqz v6, :cond_4e

    add-int/lit8 v6, v4, -0x1

    .line 31
    aget-char v6, v2, v6

    sget-object v7, Lc/a/b/k/b/i;->d:[I

    sget-object v8, Lc/a/b/k/b/i;->c:[I

    aget v9, v8, v5

    aget v10, v1, v4

    aget v8, v8, v10

    add-int/2addr v9, v8

    rem-int/lit16 v9, v9, 0xff

    aget v7, v7, v9

    xor-int/2addr v6, v7

    int-to-char v6, v6

    aput-char v6, v2, v4

    goto :goto_54

    :cond_4e
    add-int/lit8 v6, v4, -0x1

    .line 32
    aget-char v6, v2, v6

    aput-char v6, v2, v4

    :goto_54
    add-int/lit8 v4, v4, -0x1

    goto :goto_2e

    :cond_57
    if-eqz v5, :cond_70

    .line 33
    aget v4, v1, v0

    if-eqz v4, :cond_70

    .line 34
    sget-object v4, Lc/a/b/k/b/i;->d:[I

    sget-object v6, Lc/a/b/k/b/i;->c:[I

    aget v5, v6, v5

    aget v7, v1, v0

    aget v6, v6, v7

    add-int/2addr v5, v6

    rem-int/lit16 v5, v5, 0xff

    aget v4, v4, v5

    int-to-char v4, v4

    aput-char v4, v2, v0

    goto :goto_72

    .line 35
    :cond_70
    aput-char v0, v2, v0

    :goto_72
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 36
    :cond_75
    new-array p0, p3, [C

    :goto_77
    if-ge v0, p3, :cond_84

    sub-int p1, p3, v0

    add-int/lit8 p1, p1, -0x1

    .line 37
    aget-char p1, v2, p1

    aput-char p1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_77

    .line 38
    :cond_84
    invoke-static {p0}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 39
    :cond_89
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Illegal number of error correction codewords specified: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Ljava/lang/String;Lc/a/b/k/b/k;)Ljava/lang/String;
    .registers 13

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Lc/a/b/k/b/k;->a()I

    move-result v1

    if-ne v0, v1, :cond_a2

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lc/a/b/k/b/k;->a()I

    move-result v1

    invoke-virtual {p1}, Lc/a/b/k/b/k;->b()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    invoke-virtual {p1}, Lc/a/b/k/b/k;->d()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2f

    .line 5
    invoke-virtual {p1}, Lc/a/b/k/b/k;->b()I

    move-result p1

    invoke-static {p0, p1}, Lc/a/b/k/b/i;->a(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object p0

    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_9d

    .line 7
    :cond_2f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->capacity()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 8
    new-array v2, v1, [I

    .line 9
    new-array v3, v1, [I

    .line 10
    new-array v4, v1, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_3e
    if-ge v6, v1, :cond_5d

    add-int/lit8 v7, v6, 0x1

    .line 11
    invoke-virtual {p1, v7}, Lc/a/b/k/b/k;->a(I)I

    move-result v8

    aput v8, v2, v6

    .line 12
    invoke-virtual {p1, v7}, Lc/a/b/k/b/k;->b(I)I

    move-result v8

    aput v8, v3, v6

    .line 13
    aput v5, v4, v6

    if-lez v6, :cond_5b

    add-int/lit8 v8, v6, -0x1

    .line 14
    aget v8, v4, v8

    aget v9, v2, v6

    add-int/2addr v8, v9

    aput v8, v4, v6

    :cond_5b
    move v6, v7

    goto :goto_3e

    :cond_5d
    const/4 v4, 0x0

    :goto_5e
    if-ge v4, v1, :cond_9d

    .line 15
    new-instance v6, Ljava/lang/StringBuilder;

    aget v7, v2, v4

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    move v7, v4

    .line 16
    :goto_68
    invoke-virtual {p1}, Lc/a/b/k/b/k;->a()I

    move-result v8

    if-ge v7, v8, :cond_77

    .line 17
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/2addr v7, v1

    goto :goto_68

    .line 18
    :cond_77
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aget v7, v3, v4

    invoke-static {v6, v7}, Lc/a/b/k/b/i;->a(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v6

    move v7, v4

    const/4 v8, 0x0

    .line 19
    :goto_83
    aget v9, v3, v4

    mul-int v9, v9, v1

    if-ge v7, v9, :cond_9a

    .line 20
    invoke-virtual {p1}, Lc/a/b/k/b/k;->a()I

    move-result v9

    add-int/2addr v9, v7

    add-int/lit8 v10, v8, 0x1

    invoke-virtual {v6, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v0, v9, v8}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/2addr v7, v1

    move v8, v10

    goto :goto_83

    :cond_9a
    add-int/lit8 v4, v4, 0x1

    goto :goto_5e

    .line 21
    :cond_9d
    :goto_9d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 22
    :cond_a2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "The number of codewords does not match the selected symbol"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
