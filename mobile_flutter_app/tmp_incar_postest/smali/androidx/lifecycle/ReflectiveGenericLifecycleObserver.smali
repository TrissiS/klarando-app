.class public Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;
.super Ljava/lang/Object;
.source "ReflectiveGenericLifecycleObserver.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Lb/n/a$a;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;->a:Ljava/lang/Object;

    .line 3
    sget-object v0, Lb/n/a;->c:Lb/n/a;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Lb/n/a;->b(Ljava/lang/Class;)Lb/n/a$a;

    move-result-object p1

    iput-object p1, p0, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;->b:Lb/n/a$a;

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;->b:Lb/n/a$a;

    iget-object v1, p0, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;->a:Ljava/lang/Object;

    invoke-virtual {v0, p1, p2, v1}, Lb/n/a$a;->a(Lb/n/h;Lb/n/e$b;Ljava/lang/Object;)V

    return-void
.end method
