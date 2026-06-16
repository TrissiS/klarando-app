.class public abstract Lc/a/b/l/o;
.super Lc/a/b/l/l;
.source "UPCEANReader.java"


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:[[I

.field public static final d:[[I


# direct methods
.method public static constructor <clinit>()V
    .registers 9

    const/4 v0, 0x3

    new-array v1, v0, [I

    .line 1
    fill-array-data v1, :array_90

    sput-object v1, Lc/a/b/l/o;->a:[I

    const/4 v1, 0x5

    new-array v2, v1, [I

    .line 2
    fill-array-data v2, :array_9a

    sput-object v2, Lc/a/b/l/o;->b:[I

    const/16 v2, 0xa

    new-array v3, v2, [[I

    const/4 v4, 0x4

    new-array v5, v4, [I

    .line 3
    fill-array-data v5, :array_a8

    const/4 v6, 0x0

    aput-object v5, v3, v6

    new-array v5, v4, [I

    fill-array-data v5, :array_b4

    const/4 v7, 0x1

    aput-object v5, v3, v7

    new-array v5, v4, [I

    fill-array-data v5, :array_c0

    const/4 v8, 0x2

    aput-object v5, v3, v8

    new-array v5, v4, [I

    fill-array-data v5, :array_cc

    aput-object v5, v3, v0

    new-array v0, v4, [I

    fill-array-data v0, :array_d8

    aput-object v0, v3, v4

    new-array v0, v4, [I

    fill-array-data v0, :array_e4

    aput-object v0, v3, v1

    new-array v0, v4, [I

    fill-array-data v0, :array_f0

    const/4 v1, 0x6

    aput-object v0, v3, v1

    new-array v0, v4, [I

    fill-array-data v0, :array_fc

    const/4 v1, 0x7

    aput-object v0, v3, v1

    new-array v0, v4, [I

    fill-array-data v0, :array_108

    const/16 v1, 0x8

    aput-object v0, v3, v1

    new-array v0, v4, [I

    fill-array-data v0, :array_114

    const/16 v1, 0x9

    aput-object v0, v3, v1

    sput-object v3, Lc/a/b/l/o;->c:[[I

    const/16 v0, 0x14

    new-array v1, v0, [[I

    .line 4
    sput-object v1, Lc/a/b/l/o;->d:[[I

    .line 5
    invoke-static {v3, v6, v1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_6f
    if-ge v2, v0, :cond_8f

    .line 6
    sget-object v1, Lc/a/b/l/o;->c:[[I

    add-int/lit8 v3, v2, -0xa

    aget-object v1, v1, v3

    .line 7
    array-length v3, v1

    new-array v3, v3, [I

    const/4 v4, 0x0

    .line 8
    :goto_7b
    array-length v5, v1

    if-ge v4, v5, :cond_88

    .line 9
    array-length v5, v1

    sub-int/2addr v5, v4

    sub-int/2addr v5, v7

    aget v5, v1, v5

    aput v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_7b

    .line 10
    :cond_88
    sget-object v1, Lc/a/b/l/o;->d:[[I

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6f

    :cond_8f
    return-void

    :array_90
    .array-data 4
        0x1
        0x1
        0x1
    .end array-data

    :array_9a
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_a8
    .array-data 4
        0x3
        0x2
        0x1
        0x1
    .end array-data

    :array_b4
    .array-data 4
        0x2
        0x2
        0x2
        0x1
    .end array-data

    :array_c0
    .array-data 4
        0x2
        0x1
        0x2
        0x2
    .end array-data

    :array_cc
    .array-data 4
        0x1
        0x4
        0x1
        0x1
    .end array-data

    :array_d8
    .array-data 4
        0x1
        0x1
        0x3
        0x2
    .end array-data

    :array_e4
    .array-data 4
        0x1
        0x2
        0x3
        0x1
    .end array-data

    :array_f0
    .array-data 4
        0x1
        0x1
        0x1
        0x4
    .end array-data

    :array_fc
    .array-data 4
        0x1
        0x3
        0x1
        0x2
    .end array-data

    :array_108
    .array-data 4
        0x1
        0x2
        0x1
        0x3
    .end array-data

    :array_114
    .array-data 4
        0x3
        0x1
        0x1
        0x2
    .end array-data
.end method

.method public static a(Ljava/lang/CharSequence;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/d;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    add-int/lit8 v2, v0, -0x2

    const/4 v3, 0x0

    :goto_b
    const/16 v4, 0x9

    if-ltz v2, :cond_22

    .line 2
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    add-int/lit8 v5, v5, -0x30

    if-ltz v5, :cond_1d

    if-gt v5, v4, :cond_1d

    add-int/2addr v3, v5

    add-int/lit8 v2, v2, -0x2

    goto :goto_b

    .line 3
    :cond_1d
    invoke-static {}, Lc/a/b/d;->getFormatInstance()Lc/a/b/d;

    move-result-object p0

    throw p0

    :cond_22
    mul-int/lit8 v3, v3, 0x3

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    :goto_26
    if-ltz v0, :cond_3b

    .line 4
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    add-int/lit8 v5, v5, -0x30

    if-ltz v5, :cond_36

    if-gt v5, v4, :cond_36

    add-int/2addr v3, v5

    add-int/lit8 v0, v0, -0x2

    goto :goto_26

    .line 5
    :cond_36
    invoke-static {}, Lc/a/b/d;->getFormatInstance()Lc/a/b/d;

    move-result-object p0

    throw p0

    .line 6
    :cond_3b
    rem-int/lit8 v3, v3, 0xa

    if-nez v3, :cond_40

    const/4 v1, 0x1

    :cond_40
    return v1
.end method
