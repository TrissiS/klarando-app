.class public Lb/b/q/r$b;
.super Ljava/lang/Object;
.source "DropDownListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic h:Lb/b/q/r;


# direct methods
.method public constructor <init>(Lb/b/q/r;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/r$b;->h:Lb/b/q/r;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/r$b;->h:Lb/b/q/r;

    const/4 v1, 0x0

    iput-object v1, v0, Lb/b/q/r;->u:Lb/b/q/r$b;

    .line 2
    invoke-virtual {v0, p0}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/r$b;->h:Lb/b/q/r;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/r$b;->h:Lb/b/q/r;

    const/4 v1, 0x0

    iput-object v1, v0, Lb/b/q/r;->u:Lb/b/q/r$b;

    .line 2
    invoke-virtual {v0}, Lb/b/q/r;->drawableStateChanged()V

    return-void
.end method
