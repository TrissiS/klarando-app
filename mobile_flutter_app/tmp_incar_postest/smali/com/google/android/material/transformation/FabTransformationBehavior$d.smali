.class public Lcom/google/android/material/transformation/FabTransformationBehavior$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FabTransformationBehavior.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/transformation/FabTransformationBehavior;->a(Landroid/view/View;Landroid/view/View;ZZLcom/google/android/material/transformation/FabTransformationBehavior$e;FFLjava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/v/c;


# direct methods
.method public constructor <init>(Lcom/google/android/material/transformation/FabTransformationBehavior;Lc/a/a/a/v/c;)V
    .registers 3

    .line 1
    iput-object p2, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$d;->a:Lc/a/a/a/v/c;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$d;->a:Lc/a/a/a/v/c;

    invoke-interface {p1}, Lc/a/a/a/v/c;->getRevealInfo()Lc/a/a/a/v/c$e;

    move-result-object p1

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 2
    iput v0, p1, Lc/a/a/a/v/c$e;->c:F

    .line 3
    iget-object v0, p0, Lcom/google/android/material/transformation/FabTransformationBehavior$d;->a:Lc/a/a/a/v/c;

    invoke-interface {v0, p1}, Lc/a/a/a/v/c;->setRevealInfo(Lc/a/a/a/v/c$e;)V

    return-void
.end method
