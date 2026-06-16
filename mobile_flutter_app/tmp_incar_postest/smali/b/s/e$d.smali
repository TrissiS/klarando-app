.class public Lb/s/e$d;
.super Landroidx/transition/Transition$e;
.source "FragmentTransitionSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/s/e;->a(Ljava/lang/Object;Landroid/graphics/Rect;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lb/s/e;Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    iput-object p2, p0, Lb/s/e$d;->a:Landroid/graphics/Rect;

    invoke-direct {p0}, Landroidx/transition/Transition$e;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/transition/Transition;)Landroid/graphics/Rect;
    .registers 2

    .line 1
    iget-object p1, p0, Lb/s/e$d;->a:Landroid/graphics/Rect;

    if-eqz p1, :cond_e

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_e

    .line 2
    :cond_b
    iget-object p1, p0, Lb/s/e$d;->a:Landroid/graphics/Rect;

    return-object p1

    :cond_e
    :goto_e
    const/4 p1, 0x0

    return-object p1
.end method
