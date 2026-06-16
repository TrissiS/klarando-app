.class public final Lc/a/b/i/b/b;
.super Lc/a/b/i/b/g;
.source "BinaryShiftToken.java"


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
    iput-short p1, p0, Lc/a/b/i/b/b;->c:S

    int-to-short p1, p3

    .line 3
    iput-short p1, p0, Lc/a/b/i/b/b;->d:S

    return-void
.end method


# virtual methods
.method public a(Lc/a/b/j/a;[B)V
    .registers 8

    const/4 v0, 0x0

    .line 1
    :goto_1
    iget-short v1, p0, Lc/a/b/i/b/b;->d:S

    if-ge v0, v1, :cond_3b

    const/16 v2, 0x3e

    const/16 v3, 0x1f

    if-eqz v0, :cond_f

    if-ne v0, v3, :cond_2e

    if-gt v1, v2, :cond_2e

    :cond_f
    const/4 v1, 0x5

    .line 2
    invoke-virtual {p1, v3, v1}, Lc/a/b/j/a;->a(II)V

    .line 3
    iget-short v4, p0, Lc/a/b/i/b/b;->d:S

    if-le v4, v2, :cond_1f

    add-int/lit8 v4, v4, -0x1f

    const/16 v1, 0x10

    .line 4
    invoke-virtual {p1, v4, v1}, Lc/a/b/j/a;->a(II)V

    goto :goto_2e

    :cond_1f
    if-nez v0, :cond_29

    .line 5
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p1, v2, v1}, Lc/a/b/j/a;->a(II)V

    goto :goto_2e

    :cond_29
    add-int/lit8 v4, v4, -0x1f

    .line 6
    invoke-virtual {p1, v4, v1}, Lc/a/b/j/a;->a(II)V

    .line 7
    :cond_2e
    :goto_2e
    iget-short v1, p0, Lc/a/b/i/b/b;->c:S

    add-int/2addr v1, v0

    aget-byte v1, p2, v1

    const/16 v2, 0x8

    invoke-virtual {p1, v1, v2}, Lc/a/b/j/a;->a(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3b
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-short v1, p0, Lc/a/b/i/b/b;->c:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-short v1, p0, Lc/a/b/i/b/b;->c:S

    iget-short v2, p0, Lc/a/b/i/b/b;->d:S

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
