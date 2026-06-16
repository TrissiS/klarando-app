.class public Lb/l/d/b$e;
.super Ljava/lang/Object;
.source "DefaultSpecialEffectsController.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/b;->a(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/ViewGroup;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lb/l/d/b$k;


# direct methods
.method public constructor <init>(Lb/l/d/b;Landroid/view/ViewGroup;Landroid/view/View;Lb/l/d/b$k;)V
    .registers 5

    .line 1
    iput-object p2, p0, Lb/l/d/b$e;->a:Landroid/view/ViewGroup;

    iput-object p3, p0, Lb/l/d/b$e;->b:Landroid/view/View;

    iput-object p4, p0, Lb/l/d/b$e;->c:Lb/l/d/b$k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/l/d/b$e;->a:Landroid/view/ViewGroup;

    new-instance v0, Lb/l/d/b$e$a;

    invoke-direct {v0, p0}, Lb/l/d/b$e$a;-><init>(Lb/l/d/b$e;)V

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
