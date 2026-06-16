.class public Lc/a/b/k/b/e;
.super Ljava/lang/Object;
.source "DefaultPlacement.java"


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:I

.field public final c:I

.field public final d:[B


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;II)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/b/k/b/e;->a:Ljava/lang/CharSequence;

    .line 3
    iput p2, p0, Lc/a/b/k/b/e;->c:I

    .line 4
    iput p3, p0, Lc/a/b/k/b/e;->b:I

    mul-int p2, p2, p3

    .line 5
    new-array p1, p2, [B

    iput-object p1, p0, Lc/a/b/k/b/e;->d:[B

    const/4 p2, -0x1

    .line 6
    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([BB)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x4

    .line 3
    :cond_4
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    if-ne v3, v4, :cond_10

    if-nez v0, :cond_10

    add-int/lit8 v4, v2, 0x1

    .line 4
    invoke-virtual {p0, v2}, Lc/a/b/k/b/e;->a(I)V

    move v2, v4

    .line 5
    :cond_10
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    const/4 v5, 0x2

    sub-int/2addr v4, v5

    if-ne v3, v4, :cond_23

    if-nez v0, :cond_23

    iget v4, p0, Lc/a/b/k/b/e;->c:I

    rem-int/2addr v4, v1

    if-eqz v4, :cond_23

    add-int/lit8 v4, v2, 0x1

    .line 6
    invoke-virtual {p0, v2}, Lc/a/b/k/b/e;->b(I)V

    move v2, v4

    .line 7
    :cond_23
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v4, v5

    if-ne v3, v4, :cond_36

    if-nez v0, :cond_36

    iget v4, p0, Lc/a/b/k/b/e;->c:I

    rem-int/lit8 v4, v4, 0x8

    if-ne v4, v1, :cond_36

    add-int/lit8 v4, v2, 0x1

    .line 8
    invoke-virtual {p0, v2}, Lc/a/b/k/b/e;->c(I)V

    move v2, v4

    .line 9
    :cond_36
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    add-int/2addr v4, v1

    if-ne v3, v4, :cond_49

    if-ne v0, v5, :cond_49

    iget v4, p0, Lc/a/b/k/b/e;->c:I

    rem-int/lit8 v4, v4, 0x8

    if-nez v4, :cond_49

    add-int/lit8 v4, v2, 0x1

    .line 10
    invoke-virtual {p0, v2}, Lc/a/b/k/b/e;->d(I)V

    move v2, v4

    .line 11
    :cond_49
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    if-ge v3, v4, :cond_5b

    if-ltz v0, :cond_5b

    invoke-virtual {p0, v0, v3}, Lc/a/b/k/b/e;->b(II)Z

    move-result v4

    if-nez v4, :cond_5b

    add-int/lit8 v4, v2, 0x1

    .line 12
    invoke-virtual {p0, v3, v0, v2}, Lc/a/b/k/b/e;->a(III)V

    move v2, v4

    :cond_5b
    add-int/lit8 v3, v3, -0x2

    add-int/lit8 v0, v0, 0x2

    if-ltz v3, :cond_65

    .line 13
    iget v4, p0, Lc/a/b/k/b/e;->c:I

    if-lt v0, v4, :cond_49

    :cond_65
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v0, v0, 0x3

    :cond_69
    if-ltz v3, :cond_7b

    .line 14
    iget v4, p0, Lc/a/b/k/b/e;->c:I

    if-ge v0, v4, :cond_7b

    invoke-virtual {p0, v0, v3}, Lc/a/b/k/b/e;->b(II)Z

    move-result v4

    if-nez v4, :cond_7b

    add-int/lit8 v4, v2, 0x1

    .line 15
    invoke-virtual {p0, v3, v0, v2}, Lc/a/b/k/b/e;->a(III)V

    move v2, v4

    :cond_7b
    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v0, v0, -0x2

    .line 16
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    if-ge v3, v4, :cond_85

    if-gez v0, :cond_69

    :cond_85
    add-int/lit8 v3, v3, 0x3

    add-int/lit8 v0, v0, 0x1

    .line 17
    iget v4, p0, Lc/a/b/k/b/e;->b:I

    if-lt v3, v4, :cond_4

    iget v6, p0, Lc/a/b/k/b/e;->c:I

    if-lt v0, v6, :cond_4

    const/4 v0, 0x1

    sub-int/2addr v6, v0

    sub-int/2addr v4, v0

    .line 18
    invoke-virtual {p0, v6, v4}, Lc/a/b/k/b/e;->b(II)Z

    move-result v1

    if-nez v1, :cond_ac

    .line 19
    iget v1, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v1, v0

    iget v2, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v2, v0

    invoke-virtual {p0, v1, v2, v0}, Lc/a/b/k/b/e;->a(IIZ)V

    .line 20
    iget v1, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v1, v5

    iget v2, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v2, v5

    invoke-virtual {p0, v1, v2, v0}, Lc/a/b/k/b/e;->a(IIZ)V

    :cond_ac
    return-void
.end method

.method public final a(I)V
    .registers 8

    .line 35
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 36
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v0, v1

    const/4 v3, 0x2

    invoke-virtual {p0, v0, v1, p1, v3}, Lc/a/b/k/b/e;->a(IIII)V

    .line 37
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v0, v1

    const/4 v4, 0x3

    invoke-virtual {p0, v0, v3, p1, v4}, Lc/a/b/k/b/e;->a(IIII)V

    .line 38
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v3

    const/4 v5, 0x4

    invoke-virtual {p0, v2, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 39
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/4 v5, 0x5

    invoke-virtual {p0, v2, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 40
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/4 v2, 0x6

    invoke-virtual {p0, v1, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 41
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/4 v2, 0x7

    invoke-virtual {p0, v3, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 42
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/16 v1, 0x8

    invoke-virtual {p0, v4, v0, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    return-void
.end method

.method public final a(III)V
    .registers 8

    add-int/lit8 v0, p1, -0x2

    add-int/lit8 v1, p2, -0x2

    const/4 v2, 0x1

    .line 27
    invoke-virtual {p0, v0, v1, p3, v2}, Lc/a/b/k/b/e;->a(IIII)V

    add-int/lit8 v2, p2, -0x1

    const/4 v3, 0x2

    .line 28
    invoke-virtual {p0, v0, v2, p3, v3}, Lc/a/b/k/b/e;->a(IIII)V

    add-int/lit8 v0, p1, -0x1

    const/4 v3, 0x3

    .line 29
    invoke-virtual {p0, v0, v1, p3, v3}, Lc/a/b/k/b/e;->a(IIII)V

    const/4 v3, 0x4

    .line 30
    invoke-virtual {p0, v0, v2, p3, v3}, Lc/a/b/k/b/e;->a(IIII)V

    const/4 v3, 0x5

    .line 31
    invoke-virtual {p0, v0, p2, p3, v3}, Lc/a/b/k/b/e;->a(IIII)V

    const/4 v0, 0x6

    .line 32
    invoke-virtual {p0, p1, v1, p3, v0}, Lc/a/b/k/b/e;->a(IIII)V

    const/4 v0, 0x7

    .line 33
    invoke-virtual {p0, p1, v2, p3, v0}, Lc/a/b/k/b/e;->a(IIII)V

    const/16 v0, 0x8

    .line 34
    invoke-virtual {p0, p1, p2, p3, v0}, Lc/a/b/k/b/e;->a(IIII)V

    return-void
.end method

.method public final a(IIII)V
    .registers 6

    if-gez p1, :cond_c

    .line 21
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    add-int/2addr p1, v0

    add-int/lit8 v0, v0, 0x4

    .line 22
    rem-int/lit8 v0, v0, 0x8

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p2, v0

    :cond_c
    if-gez p2, :cond_18

    .line 23
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    add-int/2addr p2, v0

    add-int/lit8 v0, v0, 0x4

    .line 24
    rem-int/lit8 v0, v0, 0x8

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p1, v0

    .line 25
    :cond_18
    iget-object v0, p0, Lc/a/b/k/b/e;->a:Ljava/lang/CharSequence;

    invoke-interface {v0, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p3

    rsub-int/lit8 p4, p4, 0x8

    const/4 v0, 0x1

    shl-int p4, v0, p4

    and-int/2addr p3, p4

    if-eqz p3, :cond_27

    goto :goto_28

    :cond_27
    const/4 v0, 0x0

    .line 26
    :goto_28
    invoke-virtual {p0, p2, p1, v0}, Lc/a/b/k/b/e;->a(IIZ)V

    return-void
.end method

.method public final a(IIZ)V
    .registers 6

    .line 2
    iget-object v0, p0, Lc/a/b/k/b/e;->d:[B

    iget v1, p0, Lc/a/b/k/b/e;->c:I

    mul-int p2, p2, v1

    add-int/2addr p2, p1

    aput-byte p3, v0, p2

    return-void
.end method

.method public final a(II)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/e;->d:[B

    iget v1, p0, Lc/a/b/k/b/e;->c:I

    mul-int p2, p2, v1

    add-int/2addr p2, p1

    aget-byte p1, v0, p2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_d

    goto :goto_e

    :cond_d
    const/4 p2, 0x0

    :goto_e
    return p2
.end method

.method public final b(I)V
    .registers 8

    .line 2
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    const/4 v1, 0x3

    sub-int/2addr v0, v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 3
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    const/4 v4, 0x2

    sub-int/2addr v0, v4

    invoke-virtual {p0, v0, v3, p1, v4}, Lc/a/b/k/b/e;->a(IIII)V

    .line 4
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v0, v2

    invoke-virtual {p0, v0, v3, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 5
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    const/4 v5, 0x4

    sub-int/2addr v0, v5

    invoke-virtual {p0, v3, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 6
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/4 v1, 0x5

    invoke-virtual {p0, v3, v0, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 7
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v4

    const/4 v1, 0x6

    invoke-virtual {p0, v3, v0, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 8
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v2

    const/4 v1, 0x7

    invoke-virtual {p0, v3, v0, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 9
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v2

    const/16 v1, 0x8

    invoke-virtual {p0, v2, v0, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    return-void
.end method

.method public final b(II)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/b/k/b/e;->d:[B

    iget v1, p0, Lc/a/b/k/b/e;->c:I

    mul-int p2, p2, v1

    add-int/2addr p2, p1

    aget-byte p1, v0, p2

    if-ltz p1, :cond_d

    const/4 p1, 0x1

    goto :goto_e

    :cond_d
    const/4 p1, 0x0

    :goto_e
    return p1
.end method

.method public final c(I)V
    .registers 8

    .line 1
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    const/4 v1, 0x3

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v2, p1, v3}, Lc/a/b/k/b/e;->a(IIII)V

    .line 2
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    const/4 v4, 0x2

    sub-int/2addr v0, v4

    invoke-virtual {p0, v0, v2, p1, v4}, Lc/a/b/k/b/e;->a(IIII)V

    .line 3
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v0, v3

    invoke-virtual {p0, v0, v2, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 4
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v4

    const/4 v5, 0x4

    invoke-virtual {p0, v2, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 5
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v3

    const/4 v5, 0x5

    invoke-virtual {p0, v2, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 6
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v3

    const/4 v2, 0x6

    invoke-virtual {p0, v3, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 7
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v3

    const/4 v2, 0x7

    invoke-virtual {p0, v4, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 8
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v3

    const/16 v2, 0x8

    invoke-virtual {p0, v1, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    return-void
.end method

.method public final d(I)V
    .registers 8

    .line 1
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, p1, v1}, Lc/a/b/k/b/e;->a(IIII)V

    .line 2
    iget v0, p0, Lc/a/b/k/b/e;->b:I

    sub-int/2addr v0, v1

    iget v3, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v3, v1

    const/4 v4, 0x2

    invoke-virtual {p0, v0, v3, p1, v4}, Lc/a/b/k/b/e;->a(IIII)V

    .line 3
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    const/4 v3, 0x3

    sub-int/2addr v0, v3

    invoke-virtual {p0, v2, v0, p1, v3}, Lc/a/b/k/b/e;->a(IIII)V

    .line 4
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v4

    const/4 v5, 0x4

    invoke-virtual {p0, v2, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 5
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/4 v5, 0x5

    invoke-virtual {p0, v2, v0, p1, v5}, Lc/a/b/k/b/e;->a(IIII)V

    .line 6
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v3

    const/4 v2, 0x6

    invoke-virtual {p0, v1, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 7
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v4

    const/4 v2, 0x7

    invoke-virtual {p0, v1, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    .line 8
    iget v0, p0, Lc/a/b/k/b/e;->c:I

    sub-int/2addr v0, v1

    const/16 v2, 0x8

    invoke-virtual {p0, v1, v0, p1, v2}, Lc/a/b/k/b/e;->a(IIII)V

    return-void
.end method
