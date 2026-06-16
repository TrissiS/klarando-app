.class public abstract Lc/a/b/l/m;
.super Ljava/lang/Object;
.source "OneDimensionalCodeWriter.java"

# interfaces
.implements Lc/a/b/g;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a([ZI[IZ)I
    .registers 11

    .line 17
    array-length v0, p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_4
    if-ge v2, v0, :cond_19

    aget v4, p2, v2

    const/4 v5, 0x0

    :goto_9
    if-ge v5, v4, :cond_13

    add-int/lit8 v6, p1, 0x1

    .line 18
    aput-boolean p3, p0, p1

    add-int/lit8 v5, v5, 0x1

    move p1, v6

    goto :goto_9

    :cond_13
    add-int/2addr v3, v4

    xor-int/lit8 p3, p3, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_19
    return v3
.end method

.method public static a([ZIII)Lc/a/b/j/b;
    .registers 9

    .line 9
    array-length v0, p0

    add-int/2addr p3, v0

    .line 10
    invoke-static {p1, p3}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 v1, 0x1

    .line 11
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 12
    div-int p3, p1, p3

    mul-int v1, v0, p3

    sub-int v1, p1, v1

    .line 13
    div-int/lit8 v1, v1, 0x2

    .line 14
    new-instance v2, Lc/a/b/j/b;

    invoke-direct {v2, p1, p2}, Lc/a/b/j/b;-><init>(II)V

    const/4 p1, 0x0

    const/4 v3, 0x0

    :goto_1a
    if-ge v3, v0, :cond_27

    .line 15
    aget-boolean v4, p0, v3

    if-eqz v4, :cond_23

    .line 16
    invoke-virtual {v2, v1, p1, p3, p2}, Lc/a/b/j/b;->a(IIII)V

    :cond_23
    add-int/lit8 v3, v3, 0x1

    add-int/2addr v1, p3

    goto :goto_1a

    :cond_27
    return-object v2
.end method


# virtual methods
.method public a()I
    .registers 2

    const/16 v0, 0xa

    return v0
.end method

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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_46

    if-ltz p3, :cond_27

    if-ltz p4, :cond_27

    .line 2
    invoke-virtual {p0}, Lc/a/b/l/m;->a()I

    move-result p2

    if-eqz p5, :cond_1e

    .line 3
    sget-object v0, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    invoke-interface {p5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Integer;

    if-eqz p5, :cond_1e

    .line 4
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 5
    :cond_1e
    invoke-virtual {p0, p1}, Lc/a/b/l/m;->a(Ljava/lang/String;)[Z

    move-result-object p1

    .line 6
    invoke-static {p1, p3, p4, p2}, Lc/a/b/l/m;->a([ZIII)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 7
    :cond_27
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "Negative size is not allowed. Input: "

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p3, 0x78

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_46
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Found empty contents"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public abstract a(Ljava/lang/String;)[Z
.end method
