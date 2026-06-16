.class public final Lc/a/b/k/b/j;
.super Ljava/lang/Object;
.source "HighLevelEncoder.java"


# direct methods
.method public static a(CI)C
    .registers 2

    mul-int/lit16 p1, p1, 0x95

    .line 1
    rem-int/lit16 p1, p1, 0xfd

    add-int/lit8 p1, p1, 0x1

    add-int/2addr p0, p1

    const/16 p1, 0xfe

    if-gt p0, p1, :cond_c

    goto :goto_d

    :cond_c
    sub-int/2addr p0, p1

    :goto_d
    int-to-char p0, p0

    return p0
.end method

.method public static a(Ljava/lang/CharSequence;I)I
    .registers 6

    .line 92
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-ge p1, v0, :cond_1e

    .line 93
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 94
    :cond_b
    :goto_b
    invoke-static {v2}, Lc/a/b/k/b/j;->b(C)Z

    move-result v3

    if-eqz v3, :cond_1e

    if-ge p1, v0, :cond_1e

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 p1, p1, 0x1

    if-ge p1, v0, :cond_b

    .line 95
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    goto :goto_b

    :cond_1e
    return v1
.end method

.method public static a(Ljava/lang/CharSequence;II)I
    .registers 21

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 29
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v1, v2, :cond_b

    return p2

    :cond_b
    const/4 v2, 0x6

    if-nez p2, :cond_14

    new-array v3, v2, [F

    .line 30
    fill-array-data v3, :array_1e4

    goto :goto_1c

    :cond_14
    new-array v3, v2, [F

    .line 31
    fill-array-data v3, :array_1f4

    const/4 v4, 0x0

    .line 32
    aput v4, v3, p2

    :goto_1c
    const/4 v4, 0x0

    const/4 v5, 0x0

    :cond_1e
    add-int v6, v1, v5

    .line 33
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->length()I

    move-result v7

    const v8, 0x7fffffff

    const/4 v9, 0x5

    const/4 v10, 0x2

    const/4 v11, 0x4

    const/4 v12, 0x3

    const/4 v13, 0x1

    if-ne v6, v7, :cond_5c

    new-array v0, v2, [B

    new-array v1, v2, [I

    .line 34
    invoke-static {v3, v1, v8, v0}, Lc/a/b/k/b/j;->a([F[II[B)I

    move-result v2

    .line 35
    invoke-static {v0}, Lc/a/b/k/b/j;->a([B)I

    move-result v3

    .line 36
    aget v1, v1, v4

    if-ne v1, v2, :cond_3f

    return v4

    :cond_3f
    if-ne v3, v13, :cond_46

    .line 37
    aget-byte v1, v0, v9

    if-lez v1, :cond_46

    return v9

    :cond_46
    if-ne v3, v13, :cond_4d

    .line 38
    aget-byte v1, v0, v11

    if-lez v1, :cond_4d

    return v11

    :cond_4d
    if-ne v3, v13, :cond_54

    .line 39
    aget-byte v1, v0, v10

    if-lez v1, :cond_54

    return v10

    :cond_54
    if-ne v3, v13, :cond_5b

    .line 40
    aget-byte v0, v0, v12

    if-lez v0, :cond_5b

    return v12

    :cond_5b
    return v13

    .line 41
    :cond_5c
    invoke-interface {v0, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    add-int/lit8 v5, v5, 0x1

    .line 42
    invoke-static {v6}, Lc/a/b/k/b/j;->b(C)Z

    move-result v7

    const/high16 v14, 0x3f800000    # 1.0f

    if-eqz v7, :cond_75

    .line 43
    aget v7, v3, v4

    float-to-double v8, v7

    const-wide/high16 v16, 0x3fe0000000000000L    # 0.5

    add-double v8, v8, v16

    double-to-float v7, v8

    aput v7, v3, v4

    goto :goto_9e

    .line 44
    :cond_75
    invoke-static {v6}, Lc/a/b/k/b/j;->c(C)Z

    move-result v7

    if-eqz v7, :cond_8e

    .line 45
    aget v7, v3, v4

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v7, v7

    int-to-float v7, v7

    aput v7, v3, v4

    .line 46
    aget v7, v3, v4

    const/high16 v8, 0x40000000    # 2.0f

    add-float/2addr v7, v8

    aput v7, v3, v4

    goto :goto_9e

    .line 47
    :cond_8e
    aget v7, v3, v4

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v7, v7

    int-to-float v7, v7

    aput v7, v3, v4

    .line 48
    aget v7, v3, v4

    add-float/2addr v7, v14

    aput v7, v3, v4

    .line 49
    :goto_9e
    invoke-static {v6}, Lc/a/b/k/b/j;->d(C)Z

    move-result v7

    const v8, 0x402aaaab

    const v9, 0x3faaaaab

    const v16, 0x3f2aaaab

    if-eqz v7, :cond_b4

    .line 50
    aget v7, v3, v13

    add-float v7, v7, v16

    aput v7, v3, v13

    goto :goto_c5

    .line 51
    :cond_b4
    invoke-static {v6}, Lc/a/b/k/b/j;->c(C)Z

    move-result v7

    if-eqz v7, :cond_c0

    .line 52
    aget v7, v3, v13

    add-float/2addr v7, v8

    aput v7, v3, v13

    goto :goto_c5

    .line 53
    :cond_c0
    aget v7, v3, v13

    add-float/2addr v7, v9

    aput v7, v3, v13

    .line 54
    :goto_c5
    invoke-static {v6}, Lc/a/b/k/b/j;->f(C)Z

    move-result v7

    if-eqz v7, :cond_d2

    .line 55
    aget v7, v3, v10

    add-float v7, v7, v16

    aput v7, v3, v10

    goto :goto_e3

    .line 56
    :cond_d2
    invoke-static {v6}, Lc/a/b/k/b/j;->c(C)Z

    move-result v7

    if-eqz v7, :cond_de

    .line 57
    aget v7, v3, v10

    add-float/2addr v7, v8

    aput v7, v3, v10

    goto :goto_e3

    .line 58
    :cond_de
    aget v7, v3, v10

    add-float/2addr v7, v9

    aput v7, v3, v10

    .line 59
    :goto_e3
    invoke-static {v6}, Lc/a/b/k/b/j;->g(C)Z

    move-result v7

    if-eqz v7, :cond_f0

    .line 60
    aget v7, v3, v12

    add-float v7, v7, v16

    aput v7, v3, v12

    goto :goto_107

    .line 61
    :cond_f0
    invoke-static {v6}, Lc/a/b/k/b/j;->c(C)Z

    move-result v7

    if-eqz v7, :cond_ff

    .line 62
    aget v7, v3, v12

    const v8, 0x408aaaab

    add-float/2addr v7, v8

    aput v7, v3, v12

    goto :goto_107

    .line 63
    :cond_ff
    aget v7, v3, v12

    const v8, 0x40555555

    add-float/2addr v7, v8

    aput v7, v3, v12

    .line 64
    :goto_107
    invoke-static {v6}, Lc/a/b/k/b/j;->e(C)Z

    move-result v7

    if-eqz v7, :cond_115

    .line 65
    aget v7, v3, v11

    const/high16 v8, 0x3f400000    # 0.75f

    add-float/2addr v7, v8

    aput v7, v3, v11

    goto :goto_12a

    .line 66
    :cond_115
    invoke-static {v6}, Lc/a/b/k/b/j;->c(C)Z

    move-result v7

    if-eqz v7, :cond_123

    .line 67
    aget v7, v3, v11

    const/high16 v8, 0x40880000    # 4.25f

    add-float/2addr v7, v8

    aput v7, v3, v11

    goto :goto_12a

    .line 68
    :cond_123
    aget v7, v3, v11

    const/high16 v8, 0x40500000    # 3.25f

    add-float/2addr v7, v8

    aput v7, v3, v11

    .line 69
    :goto_12a
    invoke-static {v6}, Lc/a/b/k/b/j;->h(C)Z

    move-result v6

    if-eqz v6, :cond_139

    const/4 v6, 0x5

    .line 70
    aget v7, v3, v6

    const/high16 v8, 0x40800000    # 4.0f

    add-float/2addr v7, v8

    aput v7, v3, v6

    goto :goto_13f

    :cond_139
    const/4 v6, 0x5

    .line 71
    aget v7, v3, v6

    add-float/2addr v7, v14

    aput v7, v3, v6

    :goto_13f
    if-lt v5, v11, :cond_1e

    new-array v7, v2, [I

    new-array v8, v2, [B

    const v9, 0x7fffffff

    .line 72
    invoke-static {v3, v7, v9, v8}, Lc/a/b/k/b/j;->a([F[II[B)I

    .line 73
    invoke-static {v8}, Lc/a/b/k/b/j;->a([B)I

    move-result v9

    .line 74
    aget v14, v7, v4

    aget v15, v7, v6

    move v6, v15

    if-ge v14, v6, :cond_16f

    aget v6, v7, v4

    aget v14, v7, v13

    if-ge v6, v14, :cond_16f

    aget v6, v7, v4

    aget v14, v7, v10

    if-ge v6, v14, :cond_16f

    aget v6, v7, v4

    aget v14, v7, v12

    if-ge v6, v14, :cond_16f

    aget v6, v7, v4

    aget v14, v7, v11

    if-ge v6, v14, :cond_16f

    return v4

    :cond_16f
    const/4 v6, 0x5

    .line 75
    aget v14, v7, v6

    aget v6, v7, v4

    if-lt v14, v6, :cond_1e1

    aget-byte v6, v8, v13

    aget-byte v14, v8, v10

    add-int/2addr v6, v14

    aget-byte v14, v8, v12

    add-int/2addr v6, v14

    aget-byte v14, v8, v11

    add-int/2addr v6, v14

    if-nez v6, :cond_184

    goto :goto_1e1

    :cond_184
    if-ne v9, v13, :cond_18b

    .line 76
    aget-byte v6, v8, v11

    if-lez v6, :cond_18b

    return v11

    :cond_18b
    if-ne v9, v13, :cond_192

    .line 77
    aget-byte v6, v8, v10

    if-lez v6, :cond_192

    return v10

    :cond_192
    if-ne v9, v13, :cond_199

    .line 78
    aget-byte v6, v8, v12

    if-lez v6, :cond_199

    return v12

    .line 79
    :cond_199
    aget v6, v7, v13

    add-int/2addr v6, v13

    aget v8, v7, v4

    if-ge v6, v8, :cond_1e

    aget v6, v7, v13

    add-int/2addr v6, v13

    const/4 v8, 0x5

    aget v8, v7, v8

    if-ge v6, v8, :cond_1e

    aget v6, v7, v13

    add-int/2addr v6, v13

    aget v8, v7, v11

    if-ge v6, v8, :cond_1e

    aget v6, v7, v13

    add-int/2addr v6, v13

    aget v8, v7, v10

    if-ge v6, v8, :cond_1e

    .line 80
    aget v6, v7, v13

    aget v8, v7, v12

    if-ge v6, v8, :cond_1bd

    return v13

    .line 81
    :cond_1bd
    aget v6, v7, v13

    aget v7, v7, v12

    if-ne v6, v7, :cond_1e

    add-int/2addr v1, v5

    add-int/2addr v1, v13

    .line 82
    :goto_1c5
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_1e0

    .line 83
    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 84
    invoke-static {v2}, Lc/a/b/k/b/j;->i(C)Z

    move-result v3

    if-eqz v3, :cond_1d6

    return v12

    .line 85
    :cond_1d6
    invoke-static {v2}, Lc/a/b/k/b/j;->g(C)Z

    move-result v2

    if-nez v2, :cond_1dd

    goto :goto_1e0

    :cond_1dd
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c5

    :cond_1e0
    :goto_1e0
    return v13

    :cond_1e1
    :goto_1e1
    const/4 v0, 0x5

    return v0

    nop

    :array_1e4
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3fa00000    # 1.25f
    .end array-data

    :array_1f4
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
        0x40000000    # 2.0f
        0x40000000    # 2.0f
        0x40000000    # 2.0f
        0x40100000    # 2.25f
    .end array-data
.end method

.method public static a([B)I
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/4 v2, 0x6

    if-ge v0, v2, :cond_b

    .line 91
    aget-byte v2, p0, v0

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_b
    return v1
.end method

.method public static a([F[II[B)I
    .registers 8

    const/4 v0, 0x0

    .line 86
    invoke-static {p3, v0}, Ljava/util/Arrays;->fill([BB)V

    const/4 v1, 0x0

    :goto_5
    const/4 v2, 0x6

    if-ge v1, v2, :cond_26

    .line 87
    aget v2, p0, v1

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    aput v2, p1, v1

    .line 88
    aget v2, p1, v1

    if-le p2, v2, :cond_1a

    .line 89
    invoke-static {p3, v0}, Ljava/util/Arrays;->fill([BB)V

    move p2, v2

    :cond_1a
    if-ne p2, v2, :cond_23

    .line 90
    aget-byte v2, p3, v1

    add-int/lit8 v2, v2, 0x1

    int-to-byte v2, v2

    aput-byte v2, p3, v1

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_26
    return p2
.end method

.method public static a(Ljava/lang/String;Lc/a/b/k/b/l;Lc/a/b/b;Lc/a/b/b;)Ljava/lang/String;
    .registers 10

    const/4 v0, 0x6

    new-array v0, v0, [Lc/a/b/k/b/g;

    .line 2
    new-instance v1, Lc/a/b/k/b/a;

    invoke-direct {v1}, Lc/a/b/k/b/a;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lc/a/b/k/b/c;

    invoke-direct {v1}, Lc/a/b/k/b/c;-><init>()V

    const/4 v3, 0x1

    aput-object v1, v0, v3

    new-instance v1, Lc/a/b/k/b/m;

    invoke-direct {v1}, Lc/a/b/k/b/m;-><init>()V

    const/4 v4, 0x2

    aput-object v1, v0, v4

    new-instance v1, Lc/a/b/k/b/n;

    invoke-direct {v1}, Lc/a/b/k/b/n;-><init>()V

    const/4 v5, 0x3

    aput-object v1, v0, v5

    new-instance v1, Lc/a/b/k/b/f;

    invoke-direct {v1}, Lc/a/b/k/b/f;-><init>()V

    const/4 v5, 0x4

    aput-object v1, v0, v5

    new-instance v1, Lc/a/b/k/b/b;

    invoke-direct {v1}, Lc/a/b/k/b/b;-><init>()V

    const/4 v5, 0x5

    aput-object v1, v0, v5

    .line 3
    new-instance v1, Lc/a/b/k/b/h;

    invoke-direct {v1, p0}, Lc/a/b/k/b/h;-><init>(Ljava/lang/String;)V

    .line 4
    invoke-virtual {v1, p1}, Lc/a/b/k/b/h;->a(Lc/a/b/k/b/l;)V

    .line 5
    invoke-virtual {v1, p2, p3}, Lc/a/b/k/b/h;->a(Lc/a/b/b;Lc/a/b/b;)V

    const-string p1, "[)>\u001e05\u001d"

    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    const-string p2, "\u001e\u0004"

    if-eqz p1, :cond_5d

    invoke-virtual {p0, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5d

    const/16 p0, 0xec

    .line 7
    invoke-virtual {v1, p0}, Lc/a/b/k/b/h;->a(C)V

    .line 8
    invoke-virtual {v1, v4}, Lc/a/b/k/b/h;->a(I)V

    .line 9
    iget p0, v1, Lc/a/b/k/b/h;->f:I

    add-int/lit8 p0, p0, 0x7

    iput p0, v1, Lc/a/b/k/b/h;->f:I

    goto :goto_79

    :cond_5d
    const-string p1, "[)>\u001e06\u001d"

    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_79

    invoke-virtual {p0, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_79

    const/16 p0, 0xed

    .line 11
    invoke-virtual {v1, p0}, Lc/a/b/k/b/h;->a(C)V

    .line 12
    invoke-virtual {v1, v4}, Lc/a/b/k/b/h;->a(I)V

    .line 13
    iget p0, v1, Lc/a/b/k/b/h;->f:I

    add-int/lit8 p0, p0, 0x7

    iput p0, v1, Lc/a/b/k/b/h;->f:I

    .line 14
    :cond_79
    :goto_79
    invoke-virtual {v1}, Lc/a/b/k/b/h;->i()Z

    move-result p0

    if-eqz p0, :cond_92

    .line 15
    aget-object p0, v0, v2

    invoke-interface {p0, v1}, Lc/a/b/k/b/g;->a(Lc/a/b/k/b/h;)V

    .line 16
    invoke-virtual {v1}, Lc/a/b/k/b/h;->e()I

    move-result p0

    if-ltz p0, :cond_79

    .line 17
    invoke-virtual {v1}, Lc/a/b/k/b/h;->e()I

    move-result v2

    .line 18
    invoke-virtual {v1}, Lc/a/b/k/b/h;->j()V

    goto :goto_79

    .line 19
    :cond_92
    invoke-virtual {v1}, Lc/a/b/k/b/h;->a()I

    move-result p0

    .line 20
    invoke-virtual {v1}, Lc/a/b/k/b/h;->l()V

    .line 21
    invoke-virtual {v1}, Lc/a/b/k/b/h;->g()Lc/a/b/k/b/k;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/b/k/b/k;->a()I

    move-result p1

    if-ge p0, p1, :cond_ac

    if-eqz v2, :cond_ac

    if-eq v2, v5, :cond_ac

    const/16 p0, 0xfe

    .line 22
    invoke-virtual {v1, p0}, Lc/a/b/k/b/h;->a(C)V

    .line 23
    :cond_ac
    invoke-virtual {v1}, Lc/a/b/k/b/h;->b()Ljava/lang/StringBuilder;

    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    const/16 p3, 0x81

    if-ge p2, p1, :cond_bb

    .line 25
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    :cond_bb
    :goto_bb
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    if-ge p2, p1, :cond_ce

    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    add-int/2addr p2, v3

    invoke-static {p3, p2}, Lc/a/b/k/b/j;->a(CI)C

    move-result p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_bb

    .line 28
    :cond_ce
    invoke-virtual {v1}, Lc/a/b/k/b/h;->b()Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(C)V
    .registers 6

    .line 96
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    rsub-int/lit8 v2, v2, 0x4

    const-string v3, "0000"

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 98
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Illegal character: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p0, " (0x"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static b(C)Z
    .registers 2

    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static c(C)Z
    .registers 2

    const/16 v0, 0x80

    if-lt p0, v0, :cond_a

    const/16 v0, 0xff

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static d(C)Z
    .registers 2

    const/16 v0, 0x20

    if-eq p0, v0, :cond_17

    const/16 v0, 0x30

    if-lt p0, v0, :cond_c

    const/16 v0, 0x39

    if-le p0, v0, :cond_17

    :cond_c
    const/16 v0, 0x41

    if-lt p0, v0, :cond_15

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 p0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p0, 0x1

    :goto_18
    return p0
.end method

.method public static e(C)Z
    .registers 2

    const/16 v0, 0x20

    if-lt p0, v0, :cond_a

    const/16 v0, 0x5e

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static f(C)Z
    .registers 2

    const/16 v0, 0x20

    if-eq p0, v0, :cond_17

    const/16 v0, 0x30

    if-lt p0, v0, :cond_c

    const/16 v0, 0x39

    if-le p0, v0, :cond_17

    :cond_c
    const/16 v0, 0x61

    if-lt p0, v0, :cond_15

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 p0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 p0, 0x1

    :goto_18
    return p0
.end method

.method public static g(C)Z
    .registers 2

    .line 1
    invoke-static {p0}, Lc/a/b/k/b/j;->i(C)Z

    move-result v0

    if-nez v0, :cond_1d

    const/16 v0, 0x20

    if-eq p0, v0, :cond_1d

    const/16 v0, 0x30

    if-lt p0, v0, :cond_12

    const/16 v0, 0x39

    if-le p0, v0, :cond_1d

    :cond_12
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1b

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 p0, 0x0

    goto :goto_1e

    :cond_1d
    :goto_1d
    const/4 p0, 0x1

    :goto_1e
    return p0
.end method

.method public static h(C)Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public static i(C)Z
    .registers 2

    const/16 v0, 0xd

    if-eq p0, v0, :cond_f

    const/16 v0, 0x2a

    if-eq p0, v0, :cond_f

    const/16 v0, 0x3e

    if-ne p0, v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p0, 0x1

    :goto_10
    return p0
.end method
