.class public Lb/f/a/b/s$n;
.super Lb/f/a/b/s;
.source "TimeCycleSplineSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "n"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/f/a/b/s;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;FJLb/f/a/b/e;)Z
    .registers 12

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_12

    move-object v0, p0

    move v1, p2

    move-wide v2, p3

    move-object v4, p1

    move-object v5, p5

    .line 2
    invoke-virtual/range {v0 .. v5}, Lb/f/a/b/s;->a(FJLandroid/view/View;Lb/f/a/b/e;)F

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationZ(F)V

    .line 3
    :cond_12
    iget-boolean p1, p0, Lb/f/a/b/s;->h:Z

    return p1
.end method
