.class public final Lc/a/b/k/a;
.super Ljava/lang/Object;
.source "DataMatrixWriter.java"

# interfaces
.implements Lc/a/b/g;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lc/a/b/k/b/e;Lc/a/b/k/b/k;)Lc/a/b/j/b;
    .registers 13

    .line 17
    invoke-virtual {p1}, Lc/a/b/k/b/k;->f()I

    move-result v0

    .line 18
    invoke-virtual {p1}, Lc/a/b/k/b/k;->e()I

    move-result v1

    .line 19
    new-instance v2, Lc/a/b/n/c/b;

    invoke-virtual {p1}, Lc/a/b/k/b/k;->h()I

    move-result v3

    invoke-virtual {p1}, Lc/a/b/k/b/k;->g()I

    move-result v4

    invoke-direct {v2, v3, v4}, Lc/a/b/n/c/b;-><init>(II)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_18
    if-ge v4, v1, :cond_83

    .line 20
    iget v6, p1, Lc/a/b/k/b/k;->e:I

    rem-int v6, v4, v6

    const/4 v7, 0x1

    if-nez v6, :cond_39

    const/4 v6, 0x0

    const/4 v8, 0x0

    .line 21
    :goto_23
    invoke-virtual {p1}, Lc/a/b/k/b/k;->h()I

    move-result v9

    if-ge v6, v9, :cond_37

    .line 22
    rem-int/lit8 v9, v6, 0x2

    if-nez v9, :cond_2f

    const/4 v9, 0x1

    goto :goto_30

    :cond_2f
    const/4 v9, 0x0

    :goto_30
    invoke-virtual {v2, v8, v5, v9}, Lc/a/b/n/c/b;->a(IIZ)V

    add-int/2addr v8, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_23

    :cond_37
    add-int/lit8 v5, v5, 0x1

    :cond_39
    const/4 v6, 0x0

    const/4 v8, 0x0

    :goto_3b
    if-ge v6, v0, :cond_66

    .line 23
    iget v9, p1, Lc/a/b/k/b/k;->d:I

    rem-int v9, v6, v9

    if-nez v9, :cond_48

    .line 24
    invoke-virtual {v2, v8, v5, v7}, Lc/a/b/n/c/b;->a(IIZ)V

    add-int/lit8 v8, v8, 0x1

    .line 25
    :cond_48
    invoke-virtual {p0, v6, v4}, Lc/a/b/k/b/e;->a(II)Z

    move-result v9

    invoke-virtual {v2, v8, v5, v9}, Lc/a/b/n/c/b;->a(IIZ)V

    add-int/2addr v8, v7

    .line 26
    iget v9, p1, Lc/a/b/k/b/k;->d:I

    rem-int v10, v6, v9

    sub-int/2addr v9, v7

    if-ne v10, v9, :cond_63

    .line 27
    rem-int/lit8 v9, v4, 0x2

    if-nez v9, :cond_5d

    const/4 v9, 0x1

    goto :goto_5e

    :cond_5d
    const/4 v9, 0x0

    :goto_5e
    invoke-virtual {v2, v8, v5, v9}, Lc/a/b/n/c/b;->a(IIZ)V

    add-int/lit8 v8, v8, 0x1

    :cond_63
    add-int/lit8 v6, v6, 0x1

    goto :goto_3b

    :cond_66
    add-int/lit8 v5, v5, 0x1

    .line 28
    iget v6, p1, Lc/a/b/k/b/k;->e:I

    rem-int v8, v4, v6

    sub-int/2addr v6, v7

    if-ne v8, v6, :cond_80

    const/4 v6, 0x0

    const/4 v8, 0x0

    .line 29
    :goto_71
    invoke-virtual {p1}, Lc/a/b/k/b/k;->h()I

    move-result v9

    if-ge v6, v9, :cond_7e

    .line 30
    invoke-virtual {v2, v8, v5, v7}, Lc/a/b/n/c/b;->a(IIZ)V

    add-int/2addr v8, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_71

    :cond_7e
    add-int/lit8 v5, v5, 0x1

    :cond_80
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    .line 31
    :cond_83
    invoke-static {v2}, Lc/a/b/k/a;->a(Lc/a/b/n/c/b;)Lc/a/b/j/b;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lc/a/b/n/c/b;)Lc/a/b/j/b;
    .registers 9

    .line 32
    invoke-virtual {p0}, Lc/a/b/n/c/b;->c()I

    move-result v0

    .line 33
    invoke-virtual {p0}, Lc/a/b/n/c/b;->b()I

    move-result v1

    .line 34
    new-instance v2, Lc/a/b/j/b;

    invoke-direct {v2, v0, v1}, Lc/a/b/j/b;-><init>(II)V

    .line 35
    invoke-virtual {v2}, Lc/a/b/j/b;->a()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_12
    if-ge v4, v0, :cond_27

    const/4 v5, 0x0

    :goto_15
    if-ge v5, v1, :cond_24

    .line 36
    invoke-virtual {p0, v4, v5}, Lc/a/b/n/c/b;->a(II)B

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_21

    .line 37
    invoke-virtual {v2, v4, v5}, Lc/a/b/j/b;->b(II)V

    :cond_21
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    :cond_24
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_27
    return-object v2
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 7
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

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_95

    .line 2
    sget-object v0, Lc/a/b/a;->DATA_MATRIX:Lc/a/b/a;

    if-ne p2, v0, :cond_7e

    if-ltz p3, :cond_5f

    if-ltz p4, :cond_5f

    .line 3
    sget-object p2, Lc/a/b/k/b/l;->FORCE_NONE:Lc/a/b/k/b/l;

    const/4 p3, 0x0

    if-eqz p5, :cond_38

    .line 4
    sget-object p4, Lc/a/b/c;->DATA_MATRIX_SHAPE:Lc/a/b/c;

    invoke-interface {p5, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lc/a/b/k/b/l;

    if-eqz p4, :cond_1e

    move-object p2, p4

    .line 5
    :cond_1e
    sget-object p4, Lc/a/b/c;->MIN_SIZE:Lc/a/b/c;

    invoke-interface {p5, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lc/a/b/b;

    if-eqz p4, :cond_29

    goto :goto_2a

    :cond_29
    move-object p4, p3

    .line 6
    :goto_2a
    sget-object v0, Lc/a/b/c;->MAX_SIZE:Lc/a/b/c;

    invoke-interface {p5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lc/a/b/b;

    if-eqz p5, :cond_35

    goto :goto_36

    :cond_35
    move-object p5, p3

    :goto_36
    move-object p3, p4

    goto :goto_39

    :cond_38
    move-object p5, p3

    .line 7
    :goto_39
    invoke-static {p1, p2, p3, p5}, Lc/a/b/k/b/j;->a(Ljava/lang/String;Lc/a/b/k/b/l;Lc/a/b/b;Lc/a/b/b;)Ljava/lang/String;

    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p4

    const/4 v0, 0x1

    invoke-static {p4, p2, p3, p5, v0}, Lc/a/b/k/b/k;->a(ILc/a/b/k/b/l;Lc/a/b/b;Lc/a/b/b;Z)Lc/a/b/k/b/k;

    move-result-object p2

    .line 9
    invoke-static {p1, p2}, Lc/a/b/k/b/i;->a(Ljava/lang/String;Lc/a/b/k/b/k;)Ljava/lang/String;

    move-result-object p1

    .line 10
    new-instance p3, Lc/a/b/k/b/e;

    .line 11
    invoke-virtual {p2}, Lc/a/b/k/b/k;->f()I

    move-result p4

    invoke-virtual {p2}, Lc/a/b/k/b/k;->e()I

    move-result p5

    invoke-direct {p3, p1, p4, p5}, Lc/a/b/k/b/e;-><init>(Ljava/lang/CharSequence;II)V

    .line 12
    invoke-virtual {p3}, Lc/a/b/k/b/e;->a()V

    .line 13
    invoke-static {p3, p2}, Lc/a/b/k/a;->a(Lc/a/b/k/b/e;Lc/a/b/k/b/k;)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 14
    :cond_5f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "Requested dimensions are too small: "

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p3, 0x78

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 15
    :cond_7e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode DATA_MATRIX, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 16
    :cond_95
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Found empty contents"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
