.class public final synthetic Lc/c/d/a;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic h:Lc/c/d/g$a;


# direct methods
.method public synthetic constructor <init>(Lc/c/d/g$a;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc/c/d/a;->h:Lc/c/d/g$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lc/c/d/a;->h:Lc/c/d/g$a;

    invoke-virtual {v0}, Lc/c/d/g$a;->a()V

    return-void
.end method
