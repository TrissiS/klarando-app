.class public final Lc/a/b/i/b/c;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field public static final a:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x21

    new-array v0, v0, [I

    .line 1
    fill-array-data v0, :array_a

    sput-object v0, Lc/a/b/i/b/c;->a:[I

    return-void

    :array_a
    .array-data 4
        0x4
        0x6
        0x6
        0x8
        0x8
        0x8
        0x8
        0x8
        0x8
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
    .end array-data
.end method

.method public static a(IZ)I
    .registers 3

    if-eqz p1, :cond_5

    const/16 p1, 0x58

    goto :goto_7

    :cond_5
    const/16 p1, 0x70

    :goto_7
    mul-int/lit8 v0, p0, 0x10

    add-int/2addr p1, v0

    mul-int p1, p1, p0

    return p1
.end method

.method public static a([BII)Lc/a/b/i/b/a;
    .registers 22

    .line 1
    new-instance v0, Lc/a/b/i/b/d;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lc/a/b/i/b/d;-><init>([B)V

    invoke-virtual {v0}, Lc/a/b/i/b/d;->a()Lc/a/b/j/a;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result v1

    mul-int v1, v1, p1

    div-int/lit8 v1, v1, 0x64

    add-int/lit8 v1, v1, 0xb

    .line 3
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result v2

    add-int/2addr v2, v1

    const/16 v3, 0x20

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz p2, :cond_74

    if-gez p2, :cond_25

    const/4 v2, 0x1

    goto :goto_26

    :cond_25
    const/4 v2, 0x0

    .line 4
    :goto_26
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-eqz v2, :cond_2d

    const/4 v3, 0x4

    :cond_2d
    if-gt v7, v3, :cond_60

    .line 5
    invoke-static {v7, v2}, Lc/a/b/i/b/c;->a(IZ)I

    move-result v3

    .line 6
    sget-object v8, Lc/a/b/i/b/c;->a:[I

    aget v8, v8, v7

    .line 7
    rem-int v9, v3, v8

    sub-int v9, v3, v9

    .line 8
    invoke-static {v0, v8}, Lc/a/b/i/b/c;->a(Lc/a/b/j/a;I)Lc/a/b/j/a;

    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result v10

    add-int/2addr v10, v1

    const-string v1, "Data to large for user specified layer"

    if-gt v10, v9, :cond_5a

    if-eqz v2, :cond_ba

    .line 10
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result v9

    mul-int/lit8 v10, v8, 0x40

    if-gt v9, v10, :cond_54

    goto/16 :goto_ba

    .line 11
    :cond_54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :cond_5a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 13
    :cond_60
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-array v1, v6, [Ljava/lang/Object;

    .line 14
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    const-string v2, "Illegal value %s for layers"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_74
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_77
    if-gt v8, v3, :cond_1f3

    const/4 v10, 0x3

    if-gt v8, v10, :cond_7e

    const/4 v10, 0x1

    goto :goto_7f

    :cond_7e
    const/4 v10, 0x0

    :goto_7f
    if-eqz v10, :cond_84

    add-int/lit8 v11, v8, 0x1

    goto :goto_85

    :cond_84
    move v11, v8

    .line 15
    :goto_85
    invoke-static {v11, v10}, Lc/a/b/i/b/c;->a(IZ)I

    move-result v12

    if-le v2, v12, :cond_8e

    :cond_8b
    :goto_8b
    const/4 v10, 0x1

    goto/16 :goto_1ec

    .line 16
    :cond_8e
    sget-object v13, Lc/a/b/i/b/c;->a:[I

    aget v14, v13, v11

    if-eq v9, v14, :cond_9f

    .line 17
    aget v7, v13, v11

    .line 18
    invoke-static {v0, v7}, Lc/a/b/i/b/c;->a(Lc/a/b/j/a;I)Lc/a/b/j/a;

    move-result-object v9

    move-object/from16 v18, v9

    move v9, v7

    move-object/from16 v7, v18

    .line 19
    :cond_9f
    rem-int v13, v12, v9

    sub-int v13, v12, v13

    if-eqz v10, :cond_ae

    .line 20
    invoke-virtual {v7}, Lc/a/b/j/a;->a()I

    move-result v14

    mul-int/lit8 v15, v9, 0x40

    if-le v14, v15, :cond_ae

    goto :goto_8b

    .line 21
    :cond_ae
    invoke-virtual {v7}, Lc/a/b/j/a;->a()I

    move-result v14

    add-int/2addr v14, v1

    if-gt v14, v13, :cond_8b

    move-object v0, v7

    move v8, v9

    move v2, v10

    move v7, v11

    move v3, v12

    .line 22
    :cond_ba
    :goto_ba
    invoke-static {v0, v3, v8}, Lc/a/b/i/b/c;->b(Lc/a/b/j/a;II)Lc/a/b/j/a;

    move-result-object v1

    .line 23
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result v0

    div-int/2addr v0, v8

    .line 24
    invoke-static {v2, v7, v0}, Lc/a/b/i/b/c;->a(ZII)Lc/a/b/j/a;

    move-result-object v3

    if-eqz v2, :cond_ce

    mul-int/lit8 v8, v7, 0x4

    add-int/lit8 v8, v8, 0xb

    goto :goto_d2

    :cond_ce
    mul-int/lit8 v8, v7, 0x4

    add-int/lit8 v8, v8, 0xe

    .line 25
    :goto_d2
    new-array v9, v8, [I

    const/4 v10, 0x2

    if-eqz v2, :cond_e1

    const/4 v11, 0x0

    :goto_d8
    if-ge v11, v8, :cond_df

    .line 26
    aput v11, v9, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_d8

    :cond_df
    move v11, v8

    goto :goto_107

    :cond_e1
    add-int/lit8 v11, v8, 0x1

    .line 27
    div-int/lit8 v12, v8, 0x2

    add-int/lit8 v13, v12, -0x1

    div-int/lit8 v13, v13, 0xf

    mul-int/lit8 v13, v13, 0x2

    add-int/2addr v11, v13

    .line 28
    div-int/lit8 v13, v11, 0x2

    const/4 v14, 0x0

    :goto_ef
    if-ge v14, v12, :cond_107

    .line 29
    div-int/lit8 v15, v14, 0xf

    add-int/2addr v15, v14

    sub-int v16, v12, v14

    add-int/lit8 v16, v16, -0x1

    sub-int v17, v13, v15

    add-int/lit8 v17, v17, -0x1

    .line 30
    aput v17, v9, v16

    add-int v16, v12, v14

    add-int/2addr v15, v13

    add-int/2addr v15, v6

    .line 31
    aput v15, v9, v16

    add-int/lit8 v14, v14, 0x1

    goto :goto_ef

    .line 32
    :cond_107
    :goto_107
    new-instance v12, Lc/a/b/j/b;

    invoke-direct {v12, v11}, Lc/a/b/j/b;-><init>(I)V

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_10e
    if-ge v13, v7, :cond_1a0

    sub-int v15, v7, v13

    mul-int/lit8 v15, v15, 0x4

    if-eqz v2, :cond_119

    add-int/lit8 v15, v15, 0x9

    goto :goto_11b

    :cond_119
    add-int/lit8 v15, v15, 0xc

    :goto_11b
    const/4 v4, 0x0

    :goto_11c
    if-ge v4, v15, :cond_195

    mul-int/lit8 v16, v4, 0x2

    :goto_120
    if-ge v5, v10, :cond_18f

    add-int v17, v14, v16

    add-int v6, v17, v5

    .line 33
    invoke-virtual {v1, v6}, Lc/a/b/j/a;->b(I)Z

    move-result v6

    if-eqz v6, :cond_138

    mul-int/lit8 v6, v13, 0x2

    add-int v17, v6, v5

    .line 34
    aget v10, v9, v17

    add-int/2addr v6, v4

    aget v6, v9, v6

    invoke-virtual {v12, v10, v6}, Lc/a/b/j/b;->b(II)V

    :cond_138
    mul-int/lit8 v6, v15, 0x2

    add-int/2addr v6, v14

    add-int v6, v6, v16

    add-int/2addr v6, v5

    .line 35
    invoke-virtual {v1, v6}, Lc/a/b/j/a;->b(I)Z

    move-result v6

    if-eqz v6, :cond_155

    mul-int/lit8 v6, v13, 0x2

    add-int v10, v6, v4

    .line 36
    aget v10, v9, v10

    add-int/lit8 v17, v8, -0x1

    sub-int v17, v17, v6

    sub-int v17, v17, v5

    aget v6, v9, v17

    invoke-virtual {v12, v10, v6}, Lc/a/b/j/b;->b(II)V

    :cond_155
    mul-int/lit8 v6, v15, 0x4

    add-int/2addr v6, v14

    add-int v6, v6, v16

    add-int/2addr v6, v5

    .line 37
    invoke-virtual {v1, v6}, Lc/a/b/j/a;->b(I)Z

    move-result v6

    if-eqz v6, :cond_170

    add-int/lit8 v6, v8, -0x1

    mul-int/lit8 v10, v13, 0x2

    sub-int/2addr v6, v10

    sub-int v10, v6, v5

    .line 38
    aget v10, v9, v10

    sub-int/2addr v6, v4

    aget v6, v9, v6

    invoke-virtual {v12, v10, v6}, Lc/a/b/j/b;->b(II)V

    :cond_170
    mul-int/lit8 v6, v15, 0x6

    add-int/2addr v6, v14

    add-int v6, v6, v16

    add-int/2addr v6, v5

    .line 39
    invoke-virtual {v1, v6}, Lc/a/b/j/a;->b(I)Z

    move-result v6

    if-eqz v6, :cond_18a

    add-int/lit8 v6, v8, -0x1

    mul-int/lit8 v10, v13, 0x2

    sub-int/2addr v6, v10

    sub-int/2addr v6, v4

    .line 40
    aget v6, v9, v6

    add-int/2addr v10, v5

    aget v10, v9, v10

    invoke-virtual {v12, v6, v10}, Lc/a/b/j/b;->b(II)V

    :cond_18a
    add-int/lit8 v5, v5, 0x1

    const/4 v6, 0x1

    const/4 v10, 0x2

    goto :goto_120

    :cond_18f
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v10, 0x2

    goto :goto_11c

    :cond_195
    mul-int/lit8 v15, v15, 0x8

    add-int/2addr v14, v15

    add-int/lit8 v13, v13, 0x1

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v10, 0x2

    goto/16 :goto_10e

    .line 41
    :cond_1a0
    invoke-static {v12, v2, v11, v3}, Lc/a/b/i/b/c;->a(Lc/a/b/j/b;ZILc/a/b/j/a;)V

    if-eqz v2, :cond_1ac

    .line 42
    div-int/lit8 v1, v11, 0x2

    const/4 v3, 0x5

    invoke-static {v12, v1, v3}, Lc/a/b/i/b/c;->a(Lc/a/b/j/b;II)V

    goto :goto_1d7

    .line 43
    :cond_1ac
    div-int/lit8 v1, v11, 0x2

    const/4 v3, 0x7

    invoke-static {v12, v1, v3}, Lc/a/b/i/b/c;->a(Lc/a/b/j/b;II)V

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    .line 44
    :goto_1b5
    div-int/lit8 v6, v8, 0x2

    const/4 v10, 0x1

    sub-int/2addr v6, v10

    if-ge v5, v6, :cond_1d7

    and-int/lit8 v6, v1, 0x1

    :goto_1bd
    if-ge v6, v11, :cond_1d2

    sub-int v9, v1, v3

    .line 45
    invoke-virtual {v12, v9, v6}, Lc/a/b/j/b;->b(II)V

    add-int v13, v1, v3

    .line 46
    invoke-virtual {v12, v13, v6}, Lc/a/b/j/b;->b(II)V

    .line 47
    invoke-virtual {v12, v6, v9}, Lc/a/b/j/b;->b(II)V

    .line 48
    invoke-virtual {v12, v6, v13}, Lc/a/b/j/b;->b(II)V

    add-int/lit8 v6, v6, 0x2

    goto :goto_1bd

    :cond_1d2
    add-int/lit8 v5, v5, 0xf

    add-int/lit8 v3, v3, 0x10

    goto :goto_1b5

    .line 49
    :cond_1d7
    :goto_1d7
    new-instance v1, Lc/a/b/i/b/a;

    invoke-direct {v1}, Lc/a/b/i/b/a;-><init>()V

    .line 50
    invoke-virtual {v1, v2}, Lc/a/b/i/b/a;->a(Z)V

    .line 51
    invoke-virtual {v1, v11}, Lc/a/b/i/b/a;->c(I)V

    .line 52
    invoke-virtual {v1, v7}, Lc/a/b/i/b/a;->b(I)V

    .line 53
    invoke-virtual {v1, v0}, Lc/a/b/i/b/a;->a(I)V

    .line 54
    invoke-virtual {v1, v12}, Lc/a/b/i/b/a;->a(Lc/a/b/j/b;)V

    return-object v1

    :goto_1ec
    add-int/lit8 v8, v8, 0x1

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v6, 0x1

    goto/16 :goto_77

    .line 55
    :cond_1f3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Data too large for an Aztec code"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static a(Lc/a/b/j/a;I)Lc/a/b/j/a;
    .registers 11

    .line 101
    new-instance v0, Lc/a/b/j/a;

    invoke-direct {v0}, Lc/a/b/j/a;-><init>()V

    .line 102
    invoke-virtual {p0}, Lc/a/b/j/a;->a()I

    move-result v1

    const/4 v2, 0x1

    shl-int v3, v2, p1

    add-int/lit8 v3, v3, -0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_10
    if-ge v5, v1, :cond_40

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_14
    if-ge v6, p1, :cond_29

    add-int v8, v5, v6

    if-ge v8, v1, :cond_20

    .line 103
    invoke-virtual {p0, v8}, Lc/a/b/j/a;->b(I)Z

    move-result v8

    if-eqz v8, :cond_26

    :cond_20
    add-int/lit8 v8, p1, -0x1

    sub-int/2addr v8, v6

    shl-int v8, v2, v8

    or-int/2addr v7, v8

    :cond_26
    add-int/lit8 v6, v6, 0x1

    goto :goto_14

    :cond_29
    and-int v6, v7, v3

    if-ne v6, v3, :cond_33

    .line 104
    invoke-virtual {v0, v6, p1}, Lc/a/b/j/a;->a(II)V

    :goto_30
    add-int/lit8 v5, v5, -0x1

    goto :goto_3e

    :cond_33
    if-nez v6, :cond_3b

    or-int/lit8 v6, v7, 0x1

    .line 105
    invoke-virtual {v0, v6, p1}, Lc/a/b/j/a;->a(II)V

    goto :goto_30

    .line 106
    :cond_3b
    invoke-virtual {v0, v7, p1}, Lc/a/b/j/a;->a(II)V

    :goto_3e
    add-int/2addr v5, p1

    goto :goto_10

    :cond_40
    return-object v0
.end method

.method public static a(ZII)Lc/a/b/j/a;
    .registers 5

    .line 66
    new-instance v0, Lc/a/b/j/a;

    invoke-direct {v0}, Lc/a/b/j/a;-><init>()V

    const/4 v1, 0x4

    if-eqz p0, :cond_1b

    add-int/lit8 p1, p1, -0x1

    const/4 p0, 0x2

    .line 67
    invoke-virtual {v0, p1, p0}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 p2, p2, -0x1

    const/4 p0, 0x6

    .line 68
    invoke-virtual {v0, p2, p0}, Lc/a/b/j/a;->a(II)V

    const/16 p0, 0x1c

    .line 69
    invoke-static {v0, p0, v1}, Lc/a/b/i/b/c;->b(Lc/a/b/j/a;II)Lc/a/b/j/a;

    move-result-object p0

    goto :goto_2e

    :cond_1b
    add-int/lit8 p1, p1, -0x1

    const/4 p0, 0x5

    .line 70
    invoke-virtual {v0, p1, p0}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 p2, p2, -0x1

    const/16 p0, 0xb

    .line 71
    invoke-virtual {v0, p2, p0}, Lc/a/b/j/a;->a(II)V

    const/16 p0, 0x28

    .line 72
    invoke-static {v0, p0, v1}, Lc/a/b/i/b/c;->b(Lc/a/b/j/a;II)Lc/a/b/j/a;

    move-result-object p0

    :goto_2e
    return-object p0
.end method

.method public static a(I)Lc/a/b/j/d/a;
    .registers 4

    const/4 v0, 0x4

    if-eq p0, v0, :cond_35

    const/4 v0, 0x6

    if-eq p0, v0, :cond_32

    const/16 v0, 0x8

    if-eq p0, v0, :cond_2f

    const/16 v0, 0xa

    if-eq p0, v0, :cond_2c

    const/16 v0, 0xc

    if-ne p0, v0, :cond_15

    .line 95
    sget-object p0, Lc/a/b/j/d/a;->g:Lc/a/b/j/d/a;

    return-object p0

    .line 96
    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported word size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_2c
    sget-object p0, Lc/a/b/j/d/a;->h:Lc/a/b/j/d/a;

    return-object p0

    .line 98
    :cond_2f
    sget-object p0, Lc/a/b/j/d/a;->m:Lc/a/b/j/d/a;

    return-object p0

    .line 99
    :cond_32
    sget-object p0, Lc/a/b/j/d/a;->i:Lc/a/b/j/d/a;

    return-object p0

    .line 100
    :cond_35
    sget-object p0, Lc/a/b/j/d/a;->j:Lc/a/b/j/d/a;

    return-object p0
.end method

.method public static a(Lc/a/b/j/b;II)V
    .registers 7

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p2, :cond_1c

    sub-int v1, p1, v0

    move v2, v1

    :goto_6
    add-int v3, p1, v0

    if-gt v2, v3, :cond_19

    .line 56
    invoke-virtual {p0, v2, v1}, Lc/a/b/j/b;->b(II)V

    .line 57
    invoke-virtual {p0, v2, v3}, Lc/a/b/j/b;->b(II)V

    .line 58
    invoke-virtual {p0, v1, v2}, Lc/a/b/j/b;->b(II)V

    .line 59
    invoke-virtual {p0, v3, v2}, Lc/a/b/j/b;->b(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_19
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    :cond_1c
    sub-int v0, p1, p2

    .line 60
    invoke-virtual {p0, v0, v0}, Lc/a/b/j/b;->b(II)V

    add-int/lit8 v1, v0, 0x1

    .line 61
    invoke-virtual {p0, v1, v0}, Lc/a/b/j/b;->b(II)V

    .line 62
    invoke-virtual {p0, v0, v1}, Lc/a/b/j/b;->b(II)V

    add-int/2addr p1, p2

    .line 63
    invoke-virtual {p0, p1, v0}, Lc/a/b/j/b;->b(II)V

    .line 64
    invoke-virtual {p0, p1, v1}, Lc/a/b/j/b;->b(II)V

    add-int/lit8 p2, p1, -0x1

    .line 65
    invoke-virtual {p0, p1, p2}, Lc/a/b/j/b;->b(II)V

    return-void
.end method

.method public static a(Lc/a/b/j/b;ZILc/a/b/j/a;)V
    .registers 6

    .line 73
    div-int/lit8 p2, p2, 0x2

    const/4 v0, 0x0

    if-eqz p1, :cond_40

    :goto_5
    const/4 p1, 0x7

    if-ge v0, p1, :cond_7f

    add-int/lit8 p1, p2, -0x3

    add-int/2addr p1, v0

    .line 74
    invoke-virtual {p3, v0}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_16

    add-int/lit8 v1, p2, -0x5

    .line 75
    invoke-virtual {p0, p1, v1}, Lc/a/b/j/b;->b(II)V

    :cond_16
    add-int/lit8 v1, v0, 0x7

    .line 76
    invoke-virtual {p3, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_23

    add-int/lit8 v1, p2, 0x5

    .line 77
    invoke-virtual {p0, v1, p1}, Lc/a/b/j/b;->b(II)V

    :cond_23
    rsub-int/lit8 v1, v0, 0x14

    .line 78
    invoke-virtual {p3, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_30

    add-int/lit8 v1, p2, 0x5

    .line 79
    invoke-virtual {p0, p1, v1}, Lc/a/b/j/b;->b(II)V

    :cond_30
    rsub-int/lit8 v1, v0, 0x1b

    .line 80
    invoke-virtual {p3, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_3d

    add-int/lit8 v1, p2, -0x5

    .line 81
    invoke-virtual {p0, v1, p1}, Lc/a/b/j/b;->b(II)V

    :cond_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_40
    :goto_40
    const/16 p1, 0xa

    if-ge v0, p1, :cond_7f

    add-int/lit8 p1, p2, -0x5

    add-int/2addr p1, v0

    .line 82
    div-int/lit8 v1, v0, 0x5

    add-int/2addr p1, v1

    .line 83
    invoke-virtual {p3, v0}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_55

    add-int/lit8 v1, p2, -0x7

    .line 84
    invoke-virtual {p0, p1, v1}, Lc/a/b/j/b;->b(II)V

    :cond_55
    add-int/lit8 v1, v0, 0xa

    .line 85
    invoke-virtual {p3, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_62

    add-int/lit8 v1, p2, 0x7

    .line 86
    invoke-virtual {p0, v1, p1}, Lc/a/b/j/b;->b(II)V

    :cond_62
    rsub-int/lit8 v1, v0, 0x1d

    .line 87
    invoke-virtual {p3, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_6f

    add-int/lit8 v1, p2, 0x7

    .line 88
    invoke-virtual {p0, p1, v1}, Lc/a/b/j/b;->b(II)V

    :cond_6f
    rsub-int/lit8 v1, v0, 0x27

    .line 89
    invoke-virtual {p3, v1}, Lc/a/b/j/a;->b(I)Z

    move-result v1

    if-eqz v1, :cond_7c

    add-int/lit8 v1, p2, -0x7

    .line 90
    invoke-virtual {p0, v1, p1}, Lc/a/b/j/b;->b(II)V

    :cond_7c
    add-int/lit8 v0, v0, 0x1

    goto :goto_40

    :cond_7f
    return-void
.end method

.method public static a(Lc/a/b/j/a;II)[I
    .registers 10

    .line 91
    new-array p2, p2, [I

    .line 92
    invoke-virtual {p0}, Lc/a/b/j/a;->a()I

    move-result v0

    div-int/2addr v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v0, :cond_29

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_d
    if-ge v3, p1, :cond_24

    mul-int v5, v2, p1

    add-int/2addr v5, v3

    .line 93
    invoke-virtual {p0, v5}, Lc/a/b/j/a;->b(I)Z

    move-result v5

    if-eqz v5, :cond_1f

    sub-int v5, p1, v3

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    shl-int v5, v6, v5

    goto :goto_20

    :cond_1f
    const/4 v5, 0x0

    :goto_20
    or-int/2addr v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 94
    :cond_24
    aput v4, p2, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_29
    return-object p2
.end method

.method public static b(Lc/a/b/j/a;II)Lc/a/b/j/a;
    .registers 6

    .line 1
    invoke-virtual {p0}, Lc/a/b/j/a;->a()I

    move-result v0

    div-int/2addr v0, p2

    .line 2
    new-instance v1, Lc/a/b/j/d/c;

    invoke-static {p2}, Lc/a/b/i/b/c;->a(I)Lc/a/b/j/d/a;

    move-result-object v2

    invoke-direct {v1, v2}, Lc/a/b/j/d/c;-><init>(Lc/a/b/j/d/a;)V

    .line 3
    div-int v2, p1, p2

    .line 4
    invoke-static {p0, p2, v2}, Lc/a/b/i/b/c;->a(Lc/a/b/j/a;II)[I

    move-result-object p0

    sub-int/2addr v2, v0

    .line 5
    invoke-virtual {v1, p0, v2}, Lc/a/b/j/d/c;->a([II)V

    .line 6
    rem-int/2addr p1, p2

    .line 7
    new-instance v0, Lc/a/b/j/a;

    invoke-direct {v0}, Lc/a/b/j/a;-><init>()V

    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1, p1}, Lc/a/b/j/a;->a(II)V

    .line 9
    array-length p1, p0

    :goto_23
    if-ge v1, p1, :cond_2d

    aget v2, p0, v1

    .line 10
    invoke-virtual {v0, v2, p2}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    :cond_2d
    return-object v0
.end method
