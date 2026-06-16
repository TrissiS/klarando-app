.class public Lb/l/d/s$a;
.super Landroid/transition/Transition$EpicenterCallback;
.source "FragmentTransitionCompat21.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/s;->c(Ljava/lang/Object;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lb/l/d/s;Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    iput-object p2, p0, Lb/l/d/s$a;->a:Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/transition/Transition$EpicenterCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetEpicenter(Landroid/transition/Transition;)Landroid/graphics/Rect;
    .registers 2

    .line 1
    iget-object p1, p0, Lb/l/d/s$a;->a:Landroid/graphics/Rect;

    return-object p1
.end method
