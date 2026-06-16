.class public Lb/s/v$a$a;
.super Lb/s/u;
.source "TransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/s/v$a;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lb/e/a;

.field public final synthetic b:Lb/s/v$a;


# direct methods
.method public constructor <init>(Lb/s/v$a;Lb/e/a;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/s/v$a$a;->b:Lb/s/v$a;

    iput-object p2, p0, Lb/s/v$a$a;->a:Lb/e/a;

    invoke-direct {p0}, Lb/s/u;-><init>()V

    return-void
.end method


# virtual methods
.method public e(Landroidx/transition/Transition;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/s/v$a$a;->a:Lb/e/a;

    iget-object v1, p0, Lb/s/v$a$a;->b:Lb/s/v$a;

    iget-object v1, v1, Lb/s/v$a;->i:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 2
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 3
    invoke-virtual {p1, p0}, Landroidx/transition/Transition;->b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    return-void
.end method
