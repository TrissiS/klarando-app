.class public Lb/b/q/a$a;
.super Ljava/lang/Object;
.source "AbsActionBarView.java"

# interfaces
.implements Lb/h/m/d0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public final synthetic c:Lb/b/q/a;


# direct methods
.method public constructor <init>(Lb/b/q/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/a$a;->c:Lb/b/q/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lb/b/q/a$a;->a:Z

    return-void
.end method


# virtual methods
.method public a(Lb/h/m/c0;I)Lb/b/q/a$a;
    .registers 4

    .line 1
    iget-object v0, p0, Lb/b/q/a$a;->c:Lb/b/q/a;

    iput-object p1, v0, Lb/b/q/a;->m:Lb/h/m/c0;

    .line 2
    iput p2, p0, Lb/b/q/a$a;->b:I

    return-object p0
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    .line 3
    iget-boolean p1, p0, Lb/b/q/a$a;->a:Z

    if-eqz p1, :cond_5

    return-void

    .line 4
    :cond_5
    iget-object p1, p0, Lb/b/q/a$a;->c:Lb/b/q/a;

    const/4 v0, 0x0

    iput-object v0, p1, Lb/b/q/a;->m:Lb/h/m/c0;

    .line 5
    iget v0, p0, Lb/b/q/a$a;->b:I

    invoke-static {p1, v0}, Lb/b/q/a;->b(Lb/b/q/a;I)V

    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lb/b/q/a$a;->c:Lb/b/q/a;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lb/b/q/a;->a(Lb/b/q/a;I)V

    .line 2
    iput-boolean v0, p0, Lb/b/q/a$a;->a:Z

    return-void
.end method

.method public c(Landroid/view/View;)V
    .registers 2

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lb/b/q/a$a;->a:Z

    return-void
.end method
