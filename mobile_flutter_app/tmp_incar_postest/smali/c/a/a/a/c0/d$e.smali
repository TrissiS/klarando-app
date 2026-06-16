.class public Lc/a/a/a/c0/d$e;
.super Ljava/lang/Object;
.source "FloatingActionButtonImpl.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/c0/d;->i()Landroid/view/ViewTreeObserver$OnPreDrawListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/c0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/d$e;->h:Lc/a/a/a/c0/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d$e;->h:Lc/a/a/a/c0/d;

    invoke-virtual {v0}, Lc/a/a/a/c0/d;->s()V

    const/4 v0, 0x1

    return v0
.end method
