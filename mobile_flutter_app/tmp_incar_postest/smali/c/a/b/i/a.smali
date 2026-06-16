.class public final Lc/a/b/i/a;
.super Ljava/lang/Object;
.source "AztecWriter.java"

# interfaces
.implements Lc/a/b/g;


# static fields
.field public static final a:Ljava/nio/charset/Charset;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const-string v0, "ISO-8859-1"

    .line 1
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lc/a/b/i/a;->a:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lc/a/b/i/b/a;II)Lc/a/b/j/b;
    .registers 12

    .line 13
    invoke-virtual {p0}, Lc/a/b/i/b/a;->a()Lc/a/b/j/b;

    move-result-object p0

    if-eqz p0, :cond_49

    .line 14
    invoke-virtual {p0}, Lc/a/b/j/b;->c()I

    move-result v0

    .line 15
    invoke-virtual {p0}, Lc/a/b/j/b;->b()I

    move-result v1

    .line 16
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 17
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 18
    div-int v2, p1, v0

    div-int v3, p2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    mul-int v3, v0, v2

    sub-int v3, p1, v3

    .line 19
    div-int/lit8 v3, v3, 0x2

    mul-int v4, v1, v2

    sub-int v4, p2, v4

    .line 20
    div-int/lit8 v4, v4, 0x2

    .line 21
    new-instance v5, Lc/a/b/j/b;

    invoke-direct {v5, p1, p2}, Lc/a/b/j/b;-><init>(II)V

    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_31
    if-ge p2, v1, :cond_48

    move v7, v3

    const/4 v6, 0x0

    :goto_35
    if-ge v6, v0, :cond_44

    .line 22
    invoke-virtual {p0, v6, p2}, Lc/a/b/j/b;->a(II)Z

    move-result v8

    if-eqz v8, :cond_40

    .line 23
    invoke-virtual {v5, v7, v4, v2, v2}, Lc/a/b/j/b;->a(IIII)V

    :cond_40
    add-int/lit8 v6, v6, 0x1

    add-int/2addr v7, v2

    goto :goto_35

    :cond_44
    add-int/lit8 p2, p2, 0x1

    add-int/2addr v4, v2

    goto :goto_31

    :cond_48
    return-object v5

    .line 24
    :cond_49
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
.end method

.method public static a(Ljava/lang/String;Lc/a/b/a;IILjava/nio/charset/Charset;II)Lc/a/b/j/b;
    .registers 8

    .line 9
    sget-object v0, Lc/a/b/a;->AZTEC:Lc/a/b/a;

    if-ne p1, v0, :cond_11

    .line 10
    invoke-virtual {p0, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-static {p0, p5, p6}, Lc/a/b/i/b/c;->a([BII)Lc/a/b/i/b/a;

    move-result-object p0

    .line 11
    invoke-static {p0, p2, p3}, Lc/a/b/i/a;->a(Lc/a/b/i/b/a;II)Lc/a/b/j/b;

    move-result-object p0

    return-object p0

    .line 12
    :cond_11
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Can only encode AZTEC, but got "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 16
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

    const/4 v0, 0x0

    if-nez p5, :cond_5

    move-object v1, v0

    goto :goto_d

    .line 1
    :cond_5
    sget-object v1, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    invoke-interface {p5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_d
    if-nez p5, :cond_11

    move-object v2, v0

    goto :goto_19

    .line 2
    :cond_11
    sget-object v2, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    :goto_19
    if-nez p5, :cond_1c

    goto :goto_25

    .line 3
    :cond_1c
    sget-object v0, Lc/a/b/c;->AZTEC_LAYERS:Lc/a/b/c;

    invoke-interface {p5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    move-object v0, p5

    check-cast v0, Ljava/lang/Number;

    :goto_25
    if-nez v1, :cond_2a

    .line 4
    sget-object p5, Lc/a/b/i/a;->a:Ljava/nio/charset/Charset;

    goto :goto_2e

    .line 5
    :cond_2a
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p5

    :goto_2e
    move-object v7, p5

    if-nez v2, :cond_36

    const/16 p5, 0x21

    const/16 v8, 0x21

    goto :goto_3b

    .line 6
    :cond_36
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result p5

    move v8, p5

    :goto_3b
    if-nez v0, :cond_40

    const/4 p5, 0x0

    const/4 v9, 0x0

    goto :goto_45

    .line 7
    :cond_40
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result p5

    move v9, p5

    :goto_45
    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    .line 8
    invoke-static/range {v3 .. v9}, Lc/a/b/i/a;->a(Ljava/lang/String;Lc/a/b/a;IILjava/nio/charset/Charset;II)Lc/a/b/j/b;

    move-result-object p1

    return-object p1
.end method
