.class public final Lc/a/b/m/a;
.super Ljava/lang/Object;
.source "PDF417Writer.java"

# interfaces
.implements Lc/a/b/g;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lc/a/b/m/b/e;Ljava/lang/String;IIII)Lc/a/b/j/b;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 23
    invoke-virtual {p0, p1, p2}, Lc/a/b/m/b/e;->a(Ljava/lang/String;I)V

    .line 24
    invoke-virtual {p0}, Lc/a/b/m/b/e;->a()Lc/a/b/m/b/a;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x4

    invoke-virtual {p1, p2, v0}, Lc/a/b/m/b/a;->a(II)[[B

    move-result-object p1

    const/4 v0, 0x0

    if-le p4, p3, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    .line 25
    :goto_13
    aget-object v2, p1, v0

    array-length v2, v2

    array-length v3, p1

    if-ge v2, v3, :cond_1b

    const/4 v2, 0x1

    goto :goto_1c

    :cond_1b
    const/4 v2, 0x0

    :goto_1c
    xor-int/2addr v1, v2

    if-eqz v1, :cond_25

    .line 26
    invoke-static {p1}, Lc/a/b/m/a;->a([[B)[[B

    move-result-object p1

    const/4 v1, 0x1

    goto :goto_26

    :cond_25
    const/4 v1, 0x0

    .line 27
    :goto_26
    aget-object v0, p1, v0

    array-length v0, v0

    div-int/2addr p3, v0

    .line 28
    array-length v0, p1

    div-int/2addr p4, v0

    if-ge p3, p4, :cond_2f

    goto :goto_30

    :cond_2f
    move p3, p4

    :goto_30
    if-le p3, p2, :cond_47

    .line 29
    invoke-virtual {p0}, Lc/a/b/m/b/e;->a()Lc/a/b/m/b/a;

    move-result-object p0

    mul-int/lit8 p1, p3, 0x4

    invoke-virtual {p0, p3, p1}, Lc/a/b/m/b/a;->a(II)[[B

    move-result-object p0

    if-eqz v1, :cond_42

    .line 30
    invoke-static {p0}, Lc/a/b/m/a;->a([[B)[[B

    move-result-object p0

    .line 31
    :cond_42
    invoke-static {p0, p5}, Lc/a/b/m/a;->a([[BI)Lc/a/b/j/b;

    move-result-object p0

    return-object p0

    .line 32
    :cond_47
    invoke-static {p1, p5}, Lc/a/b/m/a;->a([[BI)Lc/a/b/j/b;

    move-result-object p0

    return-object p0
.end method

.method public static a([[BI)Lc/a/b/j/b;
    .registers 9

    .line 33
    new-instance v0, Lc/a/b/j/b;

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v2, v2

    mul-int/lit8 v3, p1, 0x2

    add-int/2addr v2, v3

    array-length v4, p0

    add-int/2addr v4, v3

    invoke-direct {v0, v2, v4}, Lc/a/b/j/b;-><init>(II)V

    .line 34
    invoke-virtual {v0}, Lc/a/b/j/b;->a()V

    .line 35
    invoke-virtual {v0}, Lc/a/b/j/b;->b()I

    move-result v2

    sub-int/2addr v2, p1

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    const/4 v4, 0x0

    :goto_19
    array-length v5, p0

    if-ge v4, v5, :cond_35

    const/4 v5, 0x0

    .line 36
    :goto_1d
    aget-object v6, p0, v1

    array-length v6, v6

    if-ge v5, v6, :cond_30

    .line 37
    aget-object v6, p0, v4

    aget-byte v6, v6, v5

    if-ne v6, v3, :cond_2d

    add-int v6, v5, p1

    .line 38
    invoke-virtual {v0, v6, v2}, Lc/a/b/j/b;->b(II)V

    :cond_2d
    add-int/lit8 v5, v5, 0x1

    goto :goto_1d

    :cond_30
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v2, v2, -0x1

    goto :goto_19

    :cond_35
    return-object v0
.end method

.method public static a([[B)[[B
    .registers 9

    const/4 v0, 0x0

    .line 39
    aget-object v1, p0, v0

    array-length v1, v1

    array-length v2, p0

    const/4 v3, 0x2

    new-array v3, v3, [I

    const/4 v4, 0x1

    aput v2, v3, v4

    aput v1, v3, v0

    const-class v1, B

    invoke-static {v1, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    const/4 v2, 0x0

    .line 40
    :goto_16
    array-length v3, p0

    if-ge v2, v3, :cond_30

    .line 41
    array-length v3, p0

    sub-int/2addr v3, v2

    sub-int/2addr v3, v4

    const/4 v5, 0x0

    .line 42
    :goto_1d
    aget-object v6, p0, v0

    array-length v6, v6

    if-ge v5, v6, :cond_2d

    .line 43
    aget-object v6, v1, v5

    aget-object v7, p0, v2

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    add-int/lit8 v5, v5, 0x1

    goto :goto_1d

    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    :cond_30
    return-object v1
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lc/a/b/a;",
            "II",
            "Ljava/util/Map<",
            "Lc/a/b/c;",
            "*>;)",
            "Lc/a/b/j/b;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    sget-object v0, Lc/a/b/a;->PDF_417:Lc/a/b/a;

    if-ne p2, v0, :cond_a8

    .line 2
    new-instance v1, Lc/a/b/m/b/e;

    invoke-direct {v1}, Lc/a/b/m/b/e;-><init>()V

    const/16 p2, 0x1e

    const/4 v0, 0x2

    if-eqz p5, :cond_9d

    .line 3
    sget-object v2, Lc/a/b/c;->PDF417_COMPACT:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 4
    sget-object v2, Lc/a/b/c;->PDF417_COMPACT:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1, v2}, Lc/a/b/m/b/e;->a(Z)V

    .line 5
    :cond_25
    sget-object v2, Lc/a/b/c;->PDF417_COMPACTION:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 6
    sget-object v2, Lc/a/b/c;->PDF417_COMPACTION:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/b/m/b/c;

    invoke-virtual {v1, v2}, Lc/a/b/m/b/e;->a(Lc/a/b/m/b/c;)V

    .line 7
    :cond_38
    sget-object v2, Lc/a/b/c;->PDF417_DIMENSIONS:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5b

    .line 8
    sget-object v2, Lc/a/b/c;->PDF417_DIMENSIONS:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/b/m/b/d;

    .line 9
    invoke-virtual {v2}, Lc/a/b/m/b/d;->a()I

    move-result v3

    .line 10
    invoke-virtual {v2}, Lc/a/b/m/b/d;->c()I

    move-result v4

    .line 11
    invoke-virtual {v2}, Lc/a/b/m/b/d;->b()I

    move-result v5

    .line 12
    invoke-virtual {v2}, Lc/a/b/m/b/d;->d()I

    move-result v2

    .line 13
    invoke-virtual {v1, v3, v4, v5, v2}, Lc/a/b/m/b/e;->a(IIII)V

    .line 14
    :cond_5b
    sget-object v2, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 15
    sget-object p2, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    invoke-interface {p5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    .line 16
    :cond_6f
    sget-object v2, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_83

    .line 17
    sget-object v0, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    invoke-interface {p5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 18
    :cond_83
    sget-object v2, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9a

    .line 19
    sget-object v2, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    .line 20
    invoke-static {p5}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p5

    invoke-virtual {v1, p5}, Lc/a/b/m/b/e;->a(Ljava/nio/charset/Charset;)V

    :cond_9a
    move v6, p2

    move v3, v0

    goto :goto_a0

    :cond_9d
    const/4 v3, 0x2

    const/16 v6, 0x1e

    :goto_a0
    move-object v2, p1

    move v4, p3

    move v5, p4

    .line 21
    invoke-static/range {v1 .. v6}, Lc/a/b/m/a;->a(Lc/a/b/m/b/e;Ljava/lang/String;IIII)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 22
    :cond_a8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode PDF_417, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
