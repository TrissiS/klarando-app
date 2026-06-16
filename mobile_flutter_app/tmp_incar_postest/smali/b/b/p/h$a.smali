.class public Lb/b/p/h$a;
.super Lb/h/m/e0;
.source "ViewPropertyAnimatorCompatSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/p/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public final synthetic c:Lb/b/p/h;


# direct methods
.method public constructor <init>(Lb/b/p/h;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/p/h$a;->c:Lb/b/p/h;

    invoke-direct {p0}, Lb/h/m/e0;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lb/b/p/h$a;->a:Z

    .line 3
    iput p1, p0, Lb/b/p/h$a;->b:I

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lb/b/p/h$a;->b:I

    .line 2
    iput-boolean v0, p0, Lb/b/p/h$a;->a:Z

    .line 3
    iget-object v0, p0, Lb/b/p/h$a;->c:Lb/b/p/h;

    invoke-virtual {v0}, Lb/b/p/h;->b()V

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    .line 4
    iget p1, p0, Lb/b/p/h$a;->b:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lb/b/p/h$a;->b:I

    iget-object v0, p0, Lb/b/p/h$a;->c:Lb/b/p/h;

    iget-object v0, v0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne p1, v0, :cond_1d

    .line 5
    iget-object p1, p0, Lb/b/p/h$a;->c:Lb/b/p/h;

    iget-object p1, p1, Lb/b/p/h;->d:Lb/h/m/d0;

    if-eqz p1, :cond_1a

    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, v0}, Lb/h/m/d0;->a(Landroid/view/View;)V

    .line 7
    :cond_1a
    invoke-virtual {p0}, Lb/b/p/h$a;->a()V

    :cond_1d
    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-boolean p1, p0, Lb/b/p/h$a;->a:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lb/b/p/h$a;->a:Z

    .line 3
    iget-object p1, p0, Lb/b/p/h$a;->c:Lb/b/p/h;

    iget-object p1, p1, Lb/b/p/h;->d:Lb/h/m/d0;

    if-eqz p1, :cond_12

    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Lb/h/m/d0;->b(Landroid/view/View;)V

    :cond_12
    return-void
.end method
