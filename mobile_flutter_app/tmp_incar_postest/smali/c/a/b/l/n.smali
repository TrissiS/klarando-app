.class public final Lc/a/b/l/n;
.super Ljava/lang/Object;
.source "UPCAWriter.java"

# interfaces
.implements Lc/a/b/g;


# instance fields
.field public final a:Lc/a/b/l/h;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lc/a/b/l/h;

    invoke-direct {v0}, Lc/a/b/l/h;-><init>()V

    iput-object v0, p0, Lc/a/b/l/n;->a:Lc/a/b/l/h;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x30

    const/16 v2, 0xb

    if-ne v0, v2, :cond_34

    const/4 v0, 0x0

    const/4 v3, 0x0

    :goto_c
    if-ge v0, v2, :cond_20

    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    sub-int/2addr v4, v1

    rem-int/lit8 v5, v0, 0x2

    if-nez v5, :cond_19

    const/4 v5, 0x3

    goto :goto_1a

    :cond_19
    const/4 v5, 0x1

    :goto_1a
    mul-int v4, v4, v5

    add-int/2addr v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 6
    :cond_20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    rsub-int p0, v3, 0x3e8

    rem-int/lit8 p0, p0, 0xa

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_38

    :cond_34
    const/16 v2, 0xc

    if-ne v0, v2, :cond_48

    .line 7
    :goto_38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 8
    :cond_48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested contents should be 11 or 12 digits long, but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
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
    sget-object v0, Lc/a/b/a;->UPC_A:Lc/a/b/a;

    if-ne p2, v0, :cond_14

    .line 2
    iget-object v1, p0, Lc/a/b/l/n;->a:Lc/a/b/l/h;

    invoke-static {p1}, Lc/a/b/l/n;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lc/a/b/a;->EAN_13:Lc/a/b/a;

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Lc/a/b/l/h;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 3
    :cond_14
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode UPC-A, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
