.class public final Lc/a/b/n/a;
.super Ljava/lang/Object;
.source "QRCodeWriter.java"

# interfaces
.implements Lc/a/b/g;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lc/a/b/n/c/f;III)Lc/a/b/j/b;
    .registers 13

    .line 12
    invoke-virtual {p0}, Lc/a/b/n/c/f;->a()Lc/a/b/n/c/b;

    move-result-object p0

    if-eqz p0, :cond_4f

    .line 13
    invoke-virtual {p0}, Lc/a/b/n/c/b;->c()I

    move-result v0

    .line 14
    invoke-virtual {p0}, Lc/a/b/n/c/b;->b()I

    move-result v1

    mul-int/lit8 p3, p3, 0x2

    add-int v2, v0, p3

    add-int/2addr p3, v1

    .line 15
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 16
    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 17
    div-int v2, p1, v2

    div-int p3, p2, p3

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    mul-int v2, v0, p3

    sub-int v2, p1, v2

    .line 18
    div-int/lit8 v2, v2, 0x2

    mul-int v3, v1, p3

    sub-int v3, p2, v3

    .line 19
    div-int/lit8 v3, v3, 0x2

    .line 20
    new-instance v4, Lc/a/b/j/b;

    invoke-direct {v4, p1, p2}, Lc/a/b/j/b;-><init>(II)V

    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_36
    if-ge p2, v1, :cond_4e

    move v6, v2

    const/4 v5, 0x0

    :goto_3a
    if-ge v5, v0, :cond_4a

    .line 21
    invoke-virtual {p0, v5, p2}, Lc/a/b/n/c/b;->a(II)B

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_46

    .line 22
    invoke-virtual {v4, v6, v3, p3, p3}, Lc/a/b/j/b;->a(IIII)V

    :cond_46
    add-int/lit8 v5, v5, 0x1

    add-int/2addr v6, p3

    goto :goto_3a

    :cond_4a
    add-int/lit8 p2, p2, 0x1

    add-int/2addr v3, p3

    goto :goto_36

    :cond_4e
    return-object v4

    .line 23
    :cond_4f
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 8
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
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6b

    .line 2
    sget-object v0, Lc/a/b/a;->QR_CODE:Lc/a/b/a;

    if-ne p2, v0, :cond_54

    if-ltz p3, :cond_35

    if-ltz p4, :cond_35

    .line 3
    sget-object p2, Lc/a/b/n/b/a;->L:Lc/a/b/n/b/a;

    const/4 v0, 0x4

    if-eqz p5, :cond_2c

    .line 4
    sget-object v1, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    invoke-interface {p5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/b/n/b/a;

    if-eqz v1, :cond_1e

    move-object p2, v1

    .line 5
    :cond_1e
    sget-object v1, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    invoke-interface {p5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_2c

    .line 6
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 7
    :cond_2c
    invoke-static {p1, p2, p5}, Lc/a/b/n/c/c;->a(Ljava/lang/String;Lc/a/b/n/b/a;Ljava/util/Map;)Lc/a/b/n/c/f;

    move-result-object p1

    .line 8
    invoke-static {p1, p3, p4, v0}, Lc/a/b/n/a;->a(Lc/a/b/n/c/f;III)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 9
    :cond_35
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

    .line 10
    :cond_54
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode QR_CODE, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 11
    :cond_6b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Found empty contents"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
