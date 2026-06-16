.class public Lb/s/r;
.super Ljava/lang/Object;
.source "Scene.java"


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Ljava/lang/Runnable;


# direct methods
.method public static a(Landroid/view/ViewGroup;)Lb/s/r;
    .registers 2

    .line 5
    sget v0, Lb/s/p;->transition_current_scene:I

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb/s/r;

    return-object p0
.end method

.method public static a(Landroid/view/ViewGroup;Lb/s/r;)V
    .registers 3

    .line 4
    sget v0, Lb/s/p;->transition_current_scene:I

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/s/r;->a:Landroid/view/ViewGroup;

    invoke-static {v0}, Lb/s/r;->a(Landroid/view/ViewGroup;)Lb/s/r;

    move-result-object v0

    if-ne v0, p0, :cond_f

    .line 2
    iget-object v0, p0, Lb/s/r;->b:Ljava/lang/Runnable;

    if-eqz v0, :cond_f

    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_f
    return-void
.end method
