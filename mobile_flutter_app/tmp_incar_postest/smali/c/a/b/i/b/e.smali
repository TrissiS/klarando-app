.class public final Lc/a/b/i/b/e;
.super Lc/a/b/i/b/g;
.source "SimpleToken.java"


# instance fields
.field public final c:S

.field public final d:S


# direct methods
.method public constructor <init>(Lc/a/b/i/b/g;II)V
    .registers 4

    .line 1
    invoke-direct {p0, p1}, Lc/a/b/i/b/g;-><init>(Lc/a/b/i/b/g;)V

    int-to-short p1, p2

    .line 2
    iput-short p1, p0, Lc/a/b/i/b/e;->c:S

    int-to-short p1, p3

    .line 3
    iput-short p1, p0, Lc/a/b/i/b/e;->d:S

    return-void
.end method


# virtual methods
.method public a(Lc/a/b/j/a;[B)V
    .registers 4

    .line 1
    iget-short p2, p0, Lc/a/b/i/b/e;->c:S

    iget-short v0, p0, Lc/a/b/i/b/e;->d:S

    invoke-virtual {p1, p2, v0}, Lc/a/b/j/a;->a(II)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 1
    iget-short v0, p0, Lc/a/b/i/b/e;->c:S

    iget-short v1, p0, Lc/a/b/i/b/e;->d:S

    const/4 v2, 0x1

    shl-int v3, v2, v1

    sub-int/2addr v3, v2

    and-int/2addr v0, v3

    shl-int v1, v2, v1

    or-int/2addr v0, v1

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x3c

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-short v3, p0, Lc/a/b/i/b/e;->d:S

    shl-int v3, v2, v3

    or-int/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x3e

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
