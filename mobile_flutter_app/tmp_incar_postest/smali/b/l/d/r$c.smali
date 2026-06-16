.class public Lb/l/d/r$c;
.super Ljava/lang/Object;
.source "FragmentTransition.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/l/d/r;->a(Landroid/view/ViewGroup;Lb/l/d/r$h;Landroid/view/View;Lb/e/a;Lb/l/d/r$g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/l/d/r$g;

.field public final synthetic i:Landroidx/fragment/app/Fragment;

.field public final synthetic j:Lb/h/i/b;


# direct methods
.method public constructor <init>(Lb/l/d/r$g;Landroidx/fragment/app/Fragment;Lb/h/i/b;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lb/l/d/r$c;->h:Lb/l/d/r$g;

    iput-object p2, p0, Lb/l/d/r$c;->i:Landroidx/fragment/app/Fragment;

    iput-object p3, p0, Lb/l/d/r$c;->j:Lb/h/i/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/l/d/r$c;->h:Lb/l/d/r$g;

    iget-object v1, p0, Lb/l/d/r$c;->i:Landroidx/fragment/app/Fragment;

    iget-object v2, p0, Lb/l/d/r$c;->j:Lb/h/i/b;

    invoke-interface {v0, v1, v2}, Lb/l/d/r$g;->a(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V

    return-void
.end method
