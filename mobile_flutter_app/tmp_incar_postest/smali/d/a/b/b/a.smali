.class public abstract Ld/a/b/b/a;
.super Ljava/lang/Object;
.source "MultiClickAction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public h:I

.field public i:J

.field public final j:[J


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 2
    iput v0, p0, Ld/a/b/b/a;->h:I

    const-wide/16 v1, 0xbb8

    .line 3
    iput-wide v1, p0, Ld/a/b/b/a;->i:J

    new-array v0, v0, [J

    .line 4
    iput-object v0, p0, Ld/a/b/b/a;->j:[J

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/view/View;)V
.end method

.method public onClick(Landroid/view/View;)V
    .registers 14

    .line 1
    iget-object v0, p0, Ld/a/b/b/a;->j:[J

    array-length v1, v0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    const/4 v3, 0x0

    invoke-static {v0, v2, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 3
    iget-object v4, p0, Ld/a/b/b/a;->j:[J

    array-length v5, v4

    sub-int/2addr v5, v2

    aput-wide v0, v4, v5

    .line 4
    aget-wide v5, v4, v3

    sub-long v5, v0, v5

    iget-wide v7, p0, Ld/a/b/b/a;->i:J

    const-wide/16 v9, 0x0

    cmp-long v11, v5, v7

    if-gtz v11, :cond_2f

    new-array v0, v3, [Ljava/lang/Object;

    const-string v1, "MultiClick valid"

    .line 5
    invoke-static {v1, v0}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 6
    iget-object v0, p0, Ld/a/b/b/a;->j:[J

    invoke-static {v0, v9, v10}, Ljava/util/Arrays;->fill([JJ)V

    .line 7
    invoke-virtual {p0, p1}, Ld/a/b/b/a;->a(Landroid/view/View;)V

    goto :goto_48

    .line 8
    :cond_2f
    aget-wide v5, v4, v3

    cmp-long p1, v5, v9

    if-nez p1, :cond_48

    aget-wide v2, v4, v2

    cmp-long p1, v2, v9

    if-nez p1, :cond_48

    const/4 p1, 0x2

    aget-wide v2, v4, p1

    sub-long/2addr v0, v2

    cmp-long p1, v0, v7

    if-gtz p1, :cond_48

    const-string p1, "\u518d\u70b9\u51fb\u4e24\u6b21\u8fdb\u5165\u5de5\u5382\u6d4b\u8bd5"

    .line 9
    invoke-static {p1}, Lc/c/d/i;->a(Ljava/lang/CharSequence;)V

    :cond_48
    :goto_48
    return-void
.end method
