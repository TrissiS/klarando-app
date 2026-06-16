.class public Landroidx/lifecycle/SingleGeneratedAdapterObserver;
.super Ljava/lang/Object;
.source "SingleGeneratedAdapterObserver.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final a:Lb/n/c;


# direct methods
.method public constructor <init>(Lb/n/c;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;->a:Lb/n/c;

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;->a:Lb/n/c;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-interface {v0, p1, p2, v2, v1}, Lb/n/c;->a(Lb/n/h;Lb/n/e$b;ZLb/n/l;)V

    .line 2
    iget-object v0, p0, Landroidx/lifecycle/SingleGeneratedAdapterObserver;->a:Lb/n/c;

    const/4 v2, 0x1

    invoke-interface {v0, p1, p2, v2, v1}, Lb/n/c;->a(Lb/n/h;Lb/n/e$b;ZLb/n/l;)V

    return-void
.end method
