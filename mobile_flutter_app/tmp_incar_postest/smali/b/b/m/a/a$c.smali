.class public Lb/b/m/a/a$c;
.super Lb/b/m/a/d$a;
.source "AnimatedStateListDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/m/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public K:Lb/e/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/d<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public L:Lb/e/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/h<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/b/m/a/a$c;Lb/b/m/a/a;Landroid/content/res/Resources;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lb/b/m/a/d$a;-><init>(Lb/b/m/a/d$a;Lb/b/m/a/d;Landroid/content/res/Resources;)V

    if-eqz p1, :cond_e

    .line 2
    iget-object p2, p1, Lb/b/m/a/a$c;->K:Lb/e/d;

    iput-object p2, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    .line 3
    iget-object p1, p1, Lb/b/m/a/a$c;->L:Lb/e/h;

    iput-object p1, p0, Lb/b/m/a/a$c;->L:Lb/e/h;

    goto :goto_1c

    .line 4
    :cond_e
    new-instance p1, Lb/e/d;

    invoke-direct {p1}, Lb/e/d;-><init>()V

    iput-object p1, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    .line 5
    new-instance p1, Lb/e/h;

    invoke-direct {p1}, Lb/e/h;-><init>()V

    iput-object p1, p0, Lb/b/m/a/a$c;->L:Lb/e/h;

    :goto_1c
    return-void
.end method

.method public static f(II)J
    .registers 4

    int-to-long v0, p0

    const/16 p0, 0x20

    shl-long/2addr v0, p0

    int-to-long p0, p1

    or-long/2addr p0, v0

    return-wide p0
.end method


# virtual methods
.method public a(IILandroid/graphics/drawable/Drawable;Z)I
    .registers 14

    .line 1
    invoke-super {p0, p3}, Lb/b/m/a/b$d;->a(Landroid/graphics/drawable/Drawable;)I

    move-result p3

    .line 2
    invoke-static {p1, p2}, Lb/b/m/a/a$c;->f(II)J

    move-result-wide v0

    if-eqz p4, :cond_10

    const-wide v2, 0x200000000L

    goto :goto_12

    :cond_10
    const-wide/16 v2, 0x0

    .line 3
    :goto_12
    iget-object v4, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    int-to-long v5, p3

    or-long v7, v5, v2

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v0, v1, v7}, Lb/e/d;->a(JLjava/lang/Object;)V

    if-eqz p4, :cond_34

    .line 4
    invoke-static {p2, p1}, Lb/b/m/a/a$c;->f(II)J

    move-result-wide p1

    .line 5
    iget-object p4, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    const-wide v0, 0x100000000L

    or-long/2addr v0, v5

    or-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p4, p1, p2, v0}, Lb/e/d;->a(JLjava/lang/Object;)V

    :cond_34
    return p3
.end method

.method public a([ILandroid/graphics/drawable/Drawable;I)I
    .registers 4

    .line 6
    invoke-super {p0, p1, p2}, Lb/b/m/a/d$a;->a([ILandroid/graphics/drawable/Drawable;)I

    move-result p1

    .line 7
    iget-object p2, p0, Lb/b/m/a/a$c;->L:Lb/e/h;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p1, p3}, Lb/e/h;->c(ILjava/lang/Object;)V

    return p1
.end method

.method public b([I)I
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lb/b/m/a/d$a;->a([I)I

    move-result p1

    if-ltz p1, :cond_7

    return p1

    .line 2
    :cond_7
    sget-object p1, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-super {p0, p1}, Lb/b/m/a/d$a;->a([I)I

    move-result p1

    return p1
.end method

.method public c(II)I
    .registers 6

    .line 1
    invoke-static {p1, p2}, Lb/b/m/a/a$c;->f(II)J

    move-result-wide p1

    .line 2
    iget-object v0, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lb/e/d;->b(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    long-to-int p2, p1

    return p2
.end method

.method public d(I)I
    .registers 4

    const/4 v0, 0x0

    if-gez p1, :cond_4

    goto :goto_14

    .line 1
    :cond_4
    iget-object v1, p0, Lb/b/m/a/a$c;->L:Lb/e/h;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Lb/e/h;->b(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_14
    return v0
.end method

.method public d(II)Z
    .registers 6

    .line 2
    invoke-static {p1, p2}, Lb/b/m/a/a$c;->f(II)J

    move-result-wide p1

    .line 3
    iget-object v0, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lb/e/d;->b(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    const-wide v0, 0x100000000L

    and-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_24

    const/4 p1, 0x1

    goto :goto_25

    :cond_24
    const/4 p1, 0x0

    :goto_25
    return p1
.end method

.method public e(II)Z
    .registers 6

    .line 1
    invoke-static {p1, p2}, Lb/b/m/a/a$c;->f(II)J

    move-result-wide p1

    .line 2
    iget-object v0, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lb/e/d;->b(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    const-wide v0, 0x200000000L

    and-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_24

    const/4 p1, 0x1

    goto :goto_25

    :cond_24
    const/4 p1, 0x0

    :goto_25
    return p1
.end method

.method public n()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    invoke-virtual {v0}, Lb/e/d;->clone()Lb/e/d;

    move-result-object v0

    iput-object v0, p0, Lb/b/m/a/a$c;->K:Lb/e/d;

    .line 2
    iget-object v0, p0, Lb/b/m/a/a$c;->L:Lb/e/h;

    invoke-virtual {v0}, Lb/e/h;->clone()Lb/e/h;

    move-result-object v0

    iput-object v0, p0, Lb/b/m/a/a$c;->L:Lb/e/h;

    return-void
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    new-instance v0, Lb/b/m/a/a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lb/b/m/a/a;-><init>(Lb/b/m/a/a$c;Landroid/content/res/Resources;)V

    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 2
    new-instance v0, Lb/b/m/a/a;

    invoke-direct {v0, p0, p1}, Lb/b/m/a/a;-><init>(Lb/b/m/a/a$c;Landroid/content/res/Resources;)V

    return-object v0
.end method
