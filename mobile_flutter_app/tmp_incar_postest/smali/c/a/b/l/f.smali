.class public final Lc/a/b/l/f;
.super Lc/a/b/l/m;
.source "Code39Writer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/m;-><init>()V

    return-void
.end method

.method public static a(I[I)V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_14

    rsub-int/lit8 v1, v0, 0x8

    const/4 v2, 0x1

    shl-int v1, v2, v1

    and-int/2addr v1, p0

    if-nez v1, :cond_e

    goto :goto_f

    :cond_e
    const/4 v2, 0x2

    .line 20
    :goto_f
    aput v2, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_14
    return-void
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    sget-object v0, Lc/a/b/a;->CODE_39:Lc/a/b/a;

    if-ne p2, v0, :cond_9

    .line 2
    invoke-super/range {p0 .. p5}, Lc/a/b/l/m;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 3
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode CODE_39, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/lang/String;)[Z
    .registers 14

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x50

    if-gt v0, v1, :cond_8b

    const/16 v1, 0x9

    new-array v2, v1, [I

    add-int/lit8 v3, v0, 0x19

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_10
    const-string v6, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%"

    if-ge v5, v0, :cond_48

    .line 5
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_31

    .line 6
    sget-object v7, Lc/a/b/l/e;->a:[I

    aget v6, v7, v6

    invoke-static {v6, v2}, Lc/a/b/l/f;->a(I[I)V

    const/4 v6, 0x0

    :goto_26
    if-ge v6, v1, :cond_2e

    .line 7
    aget v7, v2, v6

    add-int/2addr v3, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_26

    :cond_2e
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    .line 8
    :cond_31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad contents: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 9
    :cond_48
    new-array v1, v3, [Z

    .line 10
    sget-object v3, Lc/a/b/l/e;->a:[I

    const/16 v5, 0x27

    aget v3, v3, v5

    invoke-static {v3, v2}, Lc/a/b/l/f;->a(I[I)V

    const/4 v3, 0x1

    .line 11
    invoke-static {v1, v4, v2, v3}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v7

    new-array v8, v3, [I

    aput v3, v8, v4

    .line 12
    invoke-static {v1, v7, v8, v4}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v9

    add-int/2addr v7, v9

    const/4 v9, 0x0

    :goto_62
    if-ge v9, v0, :cond_80

    .line 13
    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-virtual {v6, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    .line 14
    sget-object v11, Lc/a/b/l/e;->a:[I

    aget v10, v11, v10

    invoke-static {v10, v2}, Lc/a/b/l/f;->a(I[I)V

    .line 15
    invoke-static {v1, v7, v2, v3}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v10

    add-int/2addr v7, v10

    .line 16
    invoke-static {v1, v7, v8, v4}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v10

    add-int/2addr v7, v10

    add-int/lit8 v9, v9, 0x1

    goto :goto_62

    .line 17
    :cond_80
    sget-object p1, Lc/a/b/l/e;->a:[I

    aget p1, p1, v5

    invoke-static {p1, v2}, Lc/a/b/l/f;->a(I[I)V

    .line 18
    invoke-static {v1, v7, v2, v3}, Lc/a/b/l/m;->a([ZI[IZ)I

    return-object v1

    .line 19
    :cond_8b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested contents should be less than 80 digits long, but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
