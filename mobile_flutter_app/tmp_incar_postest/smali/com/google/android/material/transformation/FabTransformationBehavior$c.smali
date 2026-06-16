.class public Lcom/google/android/material/transformation/FabTransformationBehavior$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FabTransformationBehavior.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/transformation/FabTransformationBehavior;->d(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/v/c;

.field public final synthetic b:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Lcom/google/android/material/transformation/FabTransformationBehavior;Lc/a/a/a/v/c;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$c;->a:Lc/a/a/a/v/c;

    iput-object p3, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$c;->b:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$c;->a:Lc/a/a/a/v/c;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lc/a/a/a/v/c;->setCircularRevealOverlayDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$c;->a:Lc/a/a/a/v/c;

    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$c;->b:Landroid/graphics/drawable/Drawable;

    invoke-interface {p1, v0}, Lc/a/a/a/v/c;->setCircularRevealOverlayDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
