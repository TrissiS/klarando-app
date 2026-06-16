.class public final Lc/a/b/l/i;
.super Lc/a/b/l/p;
.source "EAN8Writer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/p;-><init>()V

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
    sget-object v0, Lc/a/b/a;->EAN_8:Lc/a/b/a;

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

    const-string p4, "Can only encode EAN_8, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/lang/String;)[Z
    .registers 9

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_54

    const/16 v0, 0x43

    new-array v0, v0, [Z

    .line 5
    sget-object v1, Lc/a/b/l/o;->a:[I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v1, v3}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v1

    add-int/2addr v1, v2

    const/4 v4, 0x0

    :goto_16
    const/4 v5, 0x3

    if-gt v4, v5, :cond_2e

    add-int/lit8 v5, v4, 0x1

    .line 6
    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 7
    sget-object v6, Lc/a/b/l/o;->c:[[I

    aget-object v4, v6, v4

    invoke-static {v0, v1, v4, v2}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v4

    add-int/2addr v1, v4

    move v4, v5

    goto :goto_16

    .line 8
    :cond_2e
    sget-object v4, Lc/a/b/l/o;->b:[I

    invoke-static {v0, v1, v4, v2}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v2

    add-int/2addr v1, v2

    const/4 v2, 0x4

    :goto_36
    const/4 v4, 0x7

    if-gt v2, v4, :cond_4e

    add-int/lit8 v4, v2, 0x1

    .line 9
    invoke-virtual {p1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 10
    sget-object v5, Lc/a/b/l/o;->c:[[I

    aget-object v2, v5, v2

    invoke-static {v0, v1, v2, v3}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v2

    add-int/2addr v1, v2

    move v2, v4

    goto :goto_36

    .line 11
    :cond_4e
    sget-object p1, Lc/a/b/l/o;->a:[I

    invoke-static {v0, v1, p1, v3}, Lc/a/b/l/m;->a([ZI[IZ)I

    return-object v0

    .line 12
    :cond_54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested contents should be 8 digits long, but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
