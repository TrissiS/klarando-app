.class public final Lc/a/b/n/c/c;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field public static final a:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x60

    new-array v0, v0, [I

    .line 1
    fill-array-data v0, :array_a

    sput-object v0, Lc/a/b/n/c/c;->a:[I

    return-void

    :array_a
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        0x24
        -0x1
        -0x1
        -0x1
        0x25
        0x26
        -0x1
        -0x1
        -0x1
        -0x1
        0x27
        0x28
        -0x1
        0x29
        0x2a
        0x2b
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0x2c
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x14
        0x15
        0x16
        0x17
        0x18
        0x19
        0x1a
        0x1b
        0x1c
        0x1d
        0x1e
        0x1f
        0x20
        0x21
        0x22
        0x23
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method public static a(I)I
    .registers 3

    .line 43
    sget-object v0, Lc/a/b/n/c/c;->a:[I

    array-length v1, v0

    if-ge p0, v1, :cond_8

    .line 44
    aget p0, v0, p0

    return p0

    :cond_8
    const/4 p0, -0x1

    return p0
.end method

.method public static a(Lc/a/b/j/a;Lc/a/b/n/b/a;Lc/a/b/n/b/c;Lc/a/b/n/c/b;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    const v0, 0x7fffffff

    const/4 v1, -0x1

    const/4 v2, 0x0

    :goto_5
    const/16 v3, 0x8

    if-ge v2, v3, :cond_17

    .line 58
    invoke-static {p0, p1, p2, v2, p3}, Lc/a/b/n/c/e;->a(Lc/a/b/j/a;Lc/a/b/n/b/a;Lc/a/b/n/b/c;ILc/a/b/n/c/b;)V

    .line 59
    invoke-static {p3}, Lc/a/b/n/c/c;->a(Lc/a/b/n/c/b;)I

    move-result v3

    if-ge v3, v0, :cond_14

    move v1, v2

    move v0, v3

    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_17
    return v1
.end method

.method public static a(Lc/a/b/n/c/b;)I
    .registers 3

    .line 1
    invoke-static {p0}, Lc/a/b/n/c/d;->a(Lc/a/b/n/c/b;)I

    move-result v0

    .line 2
    invoke-static {p0}, Lc/a/b/n/c/d;->b(Lc/a/b/n/c/b;)I

    move-result v1

    add-int/2addr v0, v1

    .line 3
    invoke-static {p0}, Lc/a/b/n/c/d;->c(Lc/a/b/n/c/b;)I

    move-result v1

    add-int/2addr v0, v1

    .line 4
    invoke-static {p0}, Lc/a/b/n/c/d;->d(Lc/a/b/n/c/b;)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public static a(Lc/a/b/j/a;III)Lc/a/b/j/a;
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    move/from16 v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    .line 87
    invoke-virtual/range {p0 .. p0}, Lc/a/b/j/a;->b()I

    move-result v0

    if-ne v0, v7, :cond_d7

    .line 88
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v8}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_16
    if-ge v11, v8, :cond_52

    const/4 v0, 0x1

    new-array v15, v0, [I

    new-array v5, v0, [I

    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move v3, v11

    move-object v4, v15

    move-object/from16 v16, v5

    .line 89
    invoke-static/range {v0 .. v5}, Lc/a/b/n/c/c;->a(IIII[I[I)V

    .line 90
    aget v0, v15, v10

    .line 91
    new-array v1, v0, [B

    mul-int/lit8 v2, v12, 0x8

    move-object/from16 v3, p0

    .line 92
    invoke-virtual {v3, v2, v1, v10, v0}, Lc/a/b/j/a;->a(I[BII)V

    .line 93
    aget v2, v16, v10

    invoke-static {v1, v2}, Lc/a/b/n/c/c;->a([BI)[B

    move-result-object v2

    .line 94
    new-instance v4, Lc/a/b/n/c/a;

    invoke-direct {v4, v1, v2}, Lc/a/b/n/c/a;-><init>([B[B)V

    invoke-interface {v9, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 95
    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 96
    array-length v0, v2

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 97
    aget v0, v15, v10

    add-int/2addr v12, v0

    add-int/lit8 v11, v11, 0x1

    goto :goto_16

    :cond_52
    if-ne v7, v12, :cond_cf

    .line 98
    new-instance v0, Lc/a/b/j/a;

    invoke-direct {v0}, Lc/a/b/j/a;-><init>()V

    const/4 v1, 0x0

    :goto_5a
    const/16 v2, 0x8

    if-ge v1, v13, :cond_7e

    .line 99
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_62
    :goto_62
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc/a/b/n/c/a;

    .line 100
    invoke-virtual {v4}, Lc/a/b/n/c/a;->a()[B

    move-result-object v4

    .line 101
    array-length v5, v4

    if-ge v1, v5, :cond_62

    .line 102
    aget-byte v4, v4, v1

    invoke-virtual {v0, v4, v2}, Lc/a/b/j/a;->a(II)V

    goto :goto_62

    :cond_7b
    add-int/lit8 v1, v1, 0x1

    goto :goto_5a

    :cond_7e
    :goto_7e
    if-ge v10, v14, :cond_a0

    .line 103
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_84
    :goto_84
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc/a/b/n/c/a;

    .line 104
    invoke-virtual {v3}, Lc/a/b/n/c/a;->b()[B

    move-result-object v3

    .line 105
    array-length v4, v3

    if-ge v10, v4, :cond_84

    .line 106
    aget-byte v3, v3, v10

    invoke-virtual {v0, v3, v2}, Lc/a/b/j/a;->a(II)V

    goto :goto_84

    :cond_9d
    add-int/lit8 v10, v10, 0x1

    goto :goto_7e

    .line 107
    :cond_a0
    invoke-virtual {v0}, Lc/a/b/j/a;->b()I

    move-result v1

    if-ne v6, v1, :cond_a7

    return-object v0

    .line 108
    :cond_a7
    new-instance v1, Lc/a/b/h;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Interleaving error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " and "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0}, Lc/a/b/j/a;->b()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " differ."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :cond_cf
    new-instance v0, Lc/a/b/h;

    const-string v1, "Data bytes does not match offset"

    invoke-direct {v0, v1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_d7
    new-instance v0, Lc/a/b/h;

    const-string v1, "Number of bits and data bytes does not match"

    invoke-direct {v0, v1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Lc/a/b/n/b/b;
    .registers 7

    const-string v0, "Shift_JIS"

    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_14

    .line 46
    invoke-static {p0}, Lc/a/b/n/c/c;->a(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_11

    sget-object p0, Lc/a/b/n/b/b;->KANJI:Lc/a/b/n/b/b;

    goto :goto_13

    :cond_11
    sget-object p0, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    :goto_13
    return-object p0

    :cond_14
    const/4 p1, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 47
    :goto_17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge p1, v2, :cond_3a

    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    const/4 v4, 0x1

    if-lt v2, v3, :cond_2c

    const/16 v3, 0x39

    if-gt v2, v3, :cond_2c

    const/4 v1, 0x1

    goto :goto_34

    .line 49
    :cond_2c
    invoke-static {v2}, Lc/a/b/n/c/c;->a(I)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_37

    const/4 v0, 0x1

    :goto_34
    add-int/lit8 p1, p1, 0x1

    goto :goto_17

    .line 50
    :cond_37
    sget-object p0, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    return-object p0

    :cond_3a
    if-eqz v0, :cond_3f

    .line 51
    sget-object p0, Lc/a/b/n/b/b;->ALPHANUMERIC:Lc/a/b/n/b/b;

    return-object p0

    :cond_3f
    if-eqz v1, :cond_44

    .line 52
    sget-object p0, Lc/a/b/n/b/b;->NUMERIC:Lc/a/b/n/b/b;

    return-object p0

    .line 53
    :cond_44
    sget-object p0, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    return-object p0
.end method

.method public static a(ILc/a/b/n/b/a;)Lc/a/b/n/b/c;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    const/4 v0, 0x1

    :goto_1
    const/16 v1, 0x28

    if-gt v0, v1, :cond_20

    .line 60
    invoke-static {v0}, Lc/a/b/n/b/c;->a(I)Lc/a/b/n/b/c;

    move-result-object v1

    .line 61
    invoke-virtual {v1}, Lc/a/b/n/b/c;->b()I

    move-result v2

    .line 62
    invoke-virtual {v1, p1}, Lc/a/b/n/b/c;->a(Lc/a/b/n/b/a;)Lc/a/b/n/b/c$b;

    move-result-object v3

    .line 63
    invoke-virtual {v3}, Lc/a/b/n/b/c$b;->d()I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v3, p0, 0x7

    .line 64
    div-int/lit8 v3, v3, 0x8

    if-lt v2, v3, :cond_1d

    return-object v1

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 65
    :cond_20
    new-instance p0, Lc/a/b/h;

    const-string p1, "Data too big"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Ljava/lang/String;Lc/a/b/n/b/a;Ljava/util/Map;)Lc/a/b/n/c/f;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lc/a/b/n/b/a;",
            "Ljava/util/Map<",
            "Lc/a/b/c;",
            "*>;)",
            "Lc/a/b/n/c/f;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    if-nez p2, :cond_4

    const/4 p2, 0x0

    goto :goto_c

    .line 5
    :cond_4
    sget-object v0, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    :goto_c
    const-string v0, "ISO-8859-1"

    if-nez p2, :cond_11

    move-object p2, v0

    .line 6
    :cond_11
    invoke-static {p0, p2}, Lc/a/b/n/c/c;->a(Ljava/lang/String;Ljava/lang/String;)Lc/a/b/n/b/b;

    move-result-object v1

    .line 7
    new-instance v2, Lc/a/b/j/a;

    invoke-direct {v2}, Lc/a/b/j/a;-><init>()V

    .line 8
    sget-object v3, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    if-ne v1, v3, :cond_2d

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 9
    invoke-static {p2}, Lc/a/b/j/c;->getCharacterSetECIByName(Ljava/lang/String;)Lc/a/b/j/c;

    move-result-object v0

    if-eqz v0, :cond_2d

    .line 10
    invoke-static {v0, v2}, Lc/a/b/n/c/c;->a(Lc/a/b/j/c;Lc/a/b/j/a;)V

    .line 11
    :cond_2d
    invoke-static {v1, v2}, Lc/a/b/n/c/c;->a(Lc/a/b/n/b/b;Lc/a/b/j/a;)V

    .line 12
    new-instance v0, Lc/a/b/j/a;

    invoke-direct {v0}, Lc/a/b/j/a;-><init>()V

    .line 13
    invoke-static {p0, v1, v0, p2}, Lc/a/b/n/c/c;->a(Ljava/lang/String;Lc/a/b/n/b/b;Lc/a/b/j/a;Ljava/lang/String;)V

    .line 14
    invoke-virtual {v2}, Lc/a/b/j/a;->a()I

    move-result p2

    const/4 v3, 0x1

    .line 15
    invoke-static {v3}, Lc/a/b/n/b/c;->a(I)Lc/a/b/n/b/c;

    move-result-object v3

    invoke-virtual {v1, v3}, Lc/a/b/n/b/b;->getCharacterCountBits(Lc/a/b/n/b/c;)I

    move-result v3

    add-int/2addr p2, v3

    .line 16
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result v3

    add-int/2addr p2, v3

    .line 17
    invoke-static {p2, p1}, Lc/a/b/n/c/c;->a(ILc/a/b/n/b/a;)Lc/a/b/n/b/c;

    move-result-object p2

    .line 18
    invoke-virtual {v2}, Lc/a/b/j/a;->a()I

    move-result v3

    .line 19
    invoke-virtual {v1, p2}, Lc/a/b/n/b/b;->getCharacterCountBits(Lc/a/b/n/b/c;)I

    move-result p2

    add-int/2addr v3, p2

    .line 20
    invoke-virtual {v0}, Lc/a/b/j/a;->a()I

    move-result p2

    add-int/2addr v3, p2

    .line 21
    invoke-static {v3, p1}, Lc/a/b/n/c/c;->a(ILc/a/b/n/b/a;)Lc/a/b/n/b/c;

    move-result-object p2

    .line 22
    new-instance v3, Lc/a/b/j/a;

    invoke-direct {v3}, Lc/a/b/j/a;-><init>()V

    .line 23
    invoke-virtual {v3, v2}, Lc/a/b/j/a;->a(Lc/a/b/j/a;)V

    .line 24
    sget-object v2, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    if-ne v1, v2, :cond_72

    invoke-virtual {v0}, Lc/a/b/j/a;->b()I

    move-result p0

    goto :goto_76

    :cond_72
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    .line 25
    :goto_76
    invoke-static {p0, p2, v1, v3}, Lc/a/b/n/c/c;->a(ILc/a/b/n/b/c;Lc/a/b/n/b/b;Lc/a/b/j/a;)V

    .line 26
    invoke-virtual {v3, v0}, Lc/a/b/j/a;->a(Lc/a/b/j/a;)V

    .line 27
    invoke-virtual {p2, p1}, Lc/a/b/n/b/c;->a(Lc/a/b/n/b/a;)Lc/a/b/n/b/c$b;

    move-result-object p0

    .line 28
    invoke-virtual {p2}, Lc/a/b/n/b/c;->b()I

    move-result v0

    invoke-virtual {p0}, Lc/a/b/n/b/c$b;->d()I

    move-result v2

    sub-int/2addr v0, v2

    .line 29
    invoke-static {v0, v3}, Lc/a/b/n/c/c;->a(ILc/a/b/j/a;)V

    .line 30
    invoke-virtual {p2}, Lc/a/b/n/b/c;->b()I

    move-result v2

    .line 31
    invoke-virtual {p0}, Lc/a/b/n/b/c$b;->c()I

    move-result p0

    .line 32
    invoke-static {v3, v2, v0, p0}, Lc/a/b/n/c/c;->a(Lc/a/b/j/a;III)Lc/a/b/j/a;

    move-result-object p0

    .line 33
    new-instance v0, Lc/a/b/n/c/f;

    invoke-direct {v0}, Lc/a/b/n/c/f;-><init>()V

    .line 34
    invoke-virtual {v0, p1}, Lc/a/b/n/c/f;->a(Lc/a/b/n/b/a;)V

    .line 35
    invoke-virtual {v0, v1}, Lc/a/b/n/c/f;->a(Lc/a/b/n/b/b;)V

    .line 36
    invoke-virtual {v0, p2}, Lc/a/b/n/c/f;->a(Lc/a/b/n/b/c;)V

    .line 37
    invoke-virtual {p2}, Lc/a/b/n/b/c;->a()I

    move-result v1

    .line 38
    new-instance v2, Lc/a/b/n/c/b;

    invoke-direct {v2, v1, v1}, Lc/a/b/n/c/b;-><init>(II)V

    .line 39
    invoke-static {p0, p1, p2, v2}, Lc/a/b/n/c/c;->a(Lc/a/b/j/a;Lc/a/b/n/b/a;Lc/a/b/n/b/c;Lc/a/b/n/c/b;)I

    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Lc/a/b/n/c/f;->a(I)V

    .line 41
    invoke-static {p0, p1, p2, v1, v2}, Lc/a/b/n/c/e;->a(Lc/a/b/j/a;Lc/a/b/n/b/a;Lc/a/b/n/b/c;ILc/a/b/n/c/b;)V

    .line 42
    invoke-virtual {v0, v2}, Lc/a/b/n/c/f;->a(Lc/a/b/n/c/b;)V

    return-object v0
.end method

.method public static a(IIII[I[I)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    if-ge p3, p2, :cond_45

    .line 76
    rem-int v0, p0, p2

    sub-int v1, p2, v0

    .line 77
    div-int v2, p0, p2

    add-int/lit8 v3, v2, 0x1

    .line 78
    div-int/2addr p1, p2

    add-int/lit8 v4, p1, 0x1

    sub-int/2addr v2, p1

    sub-int/2addr v3, v4

    if-ne v2, v3, :cond_3d

    add-int v5, v1, v0

    if-ne p2, v5, :cond_35

    add-int p2, p1, v2

    mul-int p2, p2, v1

    add-int v5, v4, v3

    mul-int v5, v5, v0

    add-int/2addr p2, v5

    if-ne p0, p2, :cond_2d

    const/4 p0, 0x0

    if-ge p3, v1, :cond_28

    .line 79
    aput p1, p4, p0

    .line 80
    aput v2, p5, p0

    goto :goto_2c

    .line 81
    :cond_28
    aput v4, p4, p0

    .line 82
    aput v3, p5, p0

    :goto_2c
    return-void

    .line 83
    :cond_2d
    new-instance p0, Lc/a/b/h;

    const-string p1, "Total bytes mismatch"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    .line 84
    :cond_35
    new-instance p0, Lc/a/b/h;

    const-string p1, "RS blocks mismatch"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    .line 85
    :cond_3d
    new-instance p0, Lc/a/b/h;

    const-string p1, "EC bytes mismatch"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    .line 86
    :cond_45
    new-instance p0, Lc/a/b/h;

    const-string p1, "Block ID too large"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(ILc/a/b/j/a;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    mul-int/lit8 v0, p0, 0x8

    .line 66
    invoke-virtual {p1}, Lc/a/b/j/a;->a()I

    move-result v1

    if-gt v1, v0, :cond_50

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_a
    const/4 v3, 0x4

    if-ge v2, v3, :cond_19

    .line 67
    invoke-virtual {p1}, Lc/a/b/j/a;->a()I

    move-result v3

    if-ge v3, v0, :cond_19

    .line 68
    invoke-virtual {p1, v1}, Lc/a/b/j/a;->a(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 69
    :cond_19
    invoke-virtual {p1}, Lc/a/b/j/a;->a()I

    move-result v2

    and-int/lit8 v2, v2, 0x7

    const/16 v3, 0x8

    if-lez v2, :cond_2b

    :goto_23
    if-ge v2, v3, :cond_2b

    .line 70
    invoke-virtual {p1, v1}, Lc/a/b/j/a;->a(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    .line 71
    :cond_2b
    invoke-virtual {p1}, Lc/a/b/j/a;->b()I

    move-result v2

    sub-int/2addr p0, v2

    :goto_30
    if-ge v1, p0, :cond_41

    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_39

    const/16 v2, 0xec

    goto :goto_3b

    :cond_39
    const/16 v2, 0x11

    .line 72
    :goto_3b
    invoke-virtual {p1, v2, v3}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    .line 73
    :cond_41
    invoke-virtual {p1}, Lc/a/b/j/a;->a()I

    move-result p0

    if-ne p0, v0, :cond_48

    return-void

    .line 74
    :cond_48
    new-instance p0, Lc/a/b/h;

    const-string p1, "Bits size does not equal capacity"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    .line 75
    :cond_50
    new-instance p0, Lc/a/b/h;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "data bits cannot fit in the QR Code"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lc/a/b/j/a;->a()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " > "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(ILc/a/b/n/b/c;Lc/a/b/n/b/b;Lc/a/b/j/a;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 119
    invoke-virtual {p2, p1}, Lc/a/b/n/b/b;->getCharacterCountBits(Lc/a/b/n/b/c;)I

    move-result p1

    const/4 p2, 0x1

    shl-int v0, p2, p1

    if-ge p0, v0, :cond_d

    .line 120
    invoke-virtual {p3, p0, p1}, Lc/a/b/j/a;->a(II)V

    return-void

    .line 121
    :cond_d
    new-instance p1, Lc/a/b/h;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is bigger than "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-int/2addr v0, p2

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static a(Lc/a/b/j/c;Lc/a/b/j/a;)V
    .registers 4

    .line 146
    sget-object v0, Lc/a/b/n/b/b;->ECI:Lc/a/b/n/b/b;

    invoke-virtual {v0}, Lc/a/b/n/b/b;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lc/a/b/j/a;->a(II)V

    .line 147
    invoke-virtual {p0}, Lc/a/b/j/c;->getValue()I

    move-result p0

    const/16 v0, 0x8

    invoke-virtual {p1, p0, v0}, Lc/a/b/j/a;->a(II)V

    return-void
.end method

.method public static a(Lc/a/b/n/b/b;Lc/a/b/j/a;)V
    .registers 3

    .line 118
    invoke-virtual {p0}, Lc/a/b/n/b/b;->getBits()I

    move-result p0

    const/4 v0, 0x4

    invoke-virtual {p1, p0, v0}, Lc/a/b/j/a;->a(II)V

    return-void
.end method

.method public static a(Ljava/lang/CharSequence;Lc/a/b/j/a;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 128
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_3d

    .line 129
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lc/a/b/n/c/c;->a(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_37

    add-int/lit8 v4, v1, 0x1

    if-ge v4, v0, :cond_31

    .line 130
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lc/a/b/n/c/c;->a(I)I

    move-result v4

    if-eq v4, v3, :cond_2b

    mul-int/lit8 v2, v2, 0x2d

    add-int/2addr v2, v4

    const/16 v3, 0xb

    .line 131
    invoke-virtual {p1, v2, v3}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v1, v1, 0x2

    goto :goto_5

    .line 132
    :cond_2b
    new-instance p0, Lc/a/b/h;

    invoke-direct {p0}, Lc/a/b/h;-><init>()V

    throw p0

    :cond_31
    const/4 v1, 0x6

    .line 133
    invoke-virtual {p1, v2, v1}, Lc/a/b/j/a;->a(II)V

    move v1, v4

    goto :goto_5

    .line 134
    :cond_37
    new-instance p0, Lc/a/b/h;

    invoke-direct {p0}, Lc/a/b/h;-><init>()V

    throw p0

    :cond_3d
    return-void
.end method

.method public static a(Ljava/lang/String;Lc/a/b/j/a;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    :try_start_0
    const-string v0, "Shift_JIS"

    .line 139
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_6} :catch_4d

    .line 140
    array-length v0, p0

    const/4 v1, 0x0

    :goto_8
    if-ge v1, v0, :cond_4c

    .line 141
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    add-int/lit8 v3, v1, 0x1

    .line 142
    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v2, v3

    const v3, 0x8140

    const/4 v4, -0x1

    if-lt v2, v3, :cond_24

    const v5, 0x9ffc

    if-gt v2, v5, :cond_24

    :goto_22
    sub-int/2addr v2, v3

    goto :goto_33

    :cond_24
    const v3, 0xe040

    if-lt v2, v3, :cond_32

    const v3, 0xebbf

    if-gt v2, v3, :cond_32

    const v3, 0xc140

    goto :goto_22

    :cond_32
    const/4 v2, -0x1

    :goto_33
    if-eq v2, v4, :cond_44

    shr-int/lit8 v3, v2, 0x8

    mul-int/lit16 v3, v3, 0xc0

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v3, v2

    const/16 v2, 0xd

    .line 143
    invoke-virtual {p1, v3, v2}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v1, v1, 0x2

    goto :goto_8

    .line 144
    :cond_44
    new-instance p0, Lc/a/b/h;

    const-string p1, "Invalid byte sequence"

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4c
    return-void

    :catch_4d
    move-exception p0

    .line 145
    new-instance p1, Lc/a/b/h;

    invoke-direct {p1, p0}, Lc/a/b/h;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static a(Ljava/lang/String;Lc/a/b/j/a;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 135
    :try_start_0
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_4} :catch_13

    .line 136
    array-length p2, p0

    const/4 v0, 0x0

    :goto_6
    if-ge v0, p2, :cond_12

    aget-byte v1, p0, v0

    const/16 v2, 0x8

    .line 137
    invoke-virtual {p1, v1, v2}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_12
    return-void

    :catch_13
    move-exception p0

    .line 138
    new-instance p1, Lc/a/b/h;

    invoke-direct {p1, p0}, Lc/a/b/h;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static a(Ljava/lang/String;Lc/a/b/n/b/b;Lc/a/b/j/a;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 122
    sget-object v0, Lc/a/b/n/c/c$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_37

    const/4 v1, 0x2

    if-eq v0, v1, :cond_33

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2f

    const/4 p3, 0x4

    if-ne v0, p3, :cond_18

    .line 123
    invoke-static {p0, p2}, Lc/a/b/n/c/c;->a(Ljava/lang/String;Lc/a/b/j/a;)V

    goto :goto_3a

    .line 124
    :cond_18
    new-instance p0, Lc/a/b/h;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid mode: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lc/a/b/h;-><init>(Ljava/lang/String;)V

    throw p0

    .line 125
    :cond_2f
    invoke-static {p0, p2, p3}, Lc/a/b/n/c/c;->a(Ljava/lang/String;Lc/a/b/j/a;Ljava/lang/String;)V

    goto :goto_3a

    .line 126
    :cond_33
    invoke-static {p0, p2}, Lc/a/b/n/c/c;->a(Ljava/lang/CharSequence;Lc/a/b/j/a;)V

    goto :goto_3a

    .line 127
    :cond_37
    invoke-static {p0, p2}, Lc/a/b/n/c/c;->b(Ljava/lang/CharSequence;Lc/a/b/j/a;)V

    :goto_3a
    return-void
.end method

.method public static a(Ljava/lang/String;)Z
    .registers 6

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "Shift_JIS"

    .line 54
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_7} :catch_2b

    .line 55
    array-length v1, p0

    .line 56
    rem-int/lit8 v2, v1, 0x2

    if-eqz v2, :cond_d

    return v0

    :cond_d
    const/4 v2, 0x0

    :goto_e
    if-ge v2, v1, :cond_29

    .line 57
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    const/16 v4, 0x81

    if-lt v3, v4, :cond_1c

    const/16 v4, 0x9f

    if-le v3, v4, :cond_25

    :cond_1c
    const/16 v4, 0xe0

    if-lt v3, v4, :cond_28

    const/16 v4, 0xeb

    if-le v3, v4, :cond_25

    goto :goto_28

    :cond_25
    add-int/lit8 v2, v2, 0x2

    goto :goto_e

    :cond_28
    :goto_28
    return v0

    :cond_29
    const/4 p0, 0x1

    return p0

    :catch_2b
    return v0
.end method

.method public static a([BI)[B
    .registers 7

    .line 112
    array-length v0, p0

    add-int v1, v0, p1

    .line 113
    new-array v1, v1, [I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v0, :cond_12

    .line 114
    aget-byte v4, p0, v3

    and-int/lit16 v4, v4, 0xff

    aput v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 115
    :cond_12
    new-instance p0, Lc/a/b/j/d/c;

    sget-object v3, Lc/a/b/j/d/a;->k:Lc/a/b/j/d/a;

    invoke-direct {p0, v3}, Lc/a/b/j/d/c;-><init>(Lc/a/b/j/d/a;)V

    invoke-virtual {p0, v1, p1}, Lc/a/b/j/d/c;->a([II)V

    .line 116
    new-array p0, p1, [B

    :goto_1e
    if-ge v2, p1, :cond_2a

    add-int v3, v0, v2

    .line 117
    aget v3, v1, v3

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    :cond_2a
    return-object p0
.end method

.method public static b(Ljava/lang/CharSequence;Lc/a/b/j/a;)V
    .registers 8

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_45

    .line 2
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    add-int/lit8 v3, v1, 0x2

    if-ge v3, v0, :cond_2d

    add-int/lit8 v4, v1, 0x1

    .line 3
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v4, v4, -0x30

    .line 4
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    mul-int/lit8 v2, v2, 0x64

    const/16 v5, 0xa

    mul-int/lit8 v4, v4, 0xa

    add-int/2addr v2, v4

    add-int/2addr v2, v3

    .line 5
    invoke-virtual {p1, v2, v5}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v1, v1, 0x3

    goto :goto_5

    :cond_2d
    add-int/lit8 v1, v1, 0x1

    if-ge v1, v0, :cond_40

    .line 6
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    add-int/lit8 v1, v1, -0x30

    mul-int/lit8 v2, v2, 0xa

    add-int/2addr v2, v1

    const/4 v1, 0x7

    .line 7
    invoke-virtual {p1, v2, v1}, Lc/a/b/j/a;->a(II)V

    move v1, v3

    goto :goto_5

    :cond_40
    const/4 v3, 0x4

    .line 8
    invoke-virtual {p1, v2, v3}, Lc/a/b/j/a;->a(II)V

    goto :goto_5

    :cond_45
    return-void
.end method
