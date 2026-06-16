.class public Lb/l/d/d$b;
.super Ljava/lang/Object;
.source "FragmentAnim.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/d;->a(Landroidx/fragment/app/Fragment;Lb/l/d/d$d;Lb/l/d/r$g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Landroidx/fragment/app/Fragment;

.field public final synthetic c:Lb/l/d/r$g;

.field public final synthetic d:Lb/h/i/b;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Lb/l/d/r$g;Lb/h/i/b;)V
    .registers 5

    .line 1
    iput-object p1, p0, Lb/l/d/d$b;->a:Landroid/view/ViewGroup;

    iput-object p2, p0, Lb/l/d/d$b;->b:Landroidx/fragment/app/Fragment;

    iput-object p3, p0, Lb/l/d/d$b;->c:Lb/l/d/r$g;

    iput-object p4, p0, Lb/l/d/d$b;->d:Lb/h/i/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/l/d/d$b;->a:Landroid/view/ViewGroup;

    new-instance v0, Lb/l/d/d$b$a;

    invoke-direct {v0, p0}, Lb/l/d/d$b$a;-><init>(Lb/l/d/d$b;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2

    return-void
.end method
