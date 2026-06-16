.class public Lc/a/a/a/p0/h$a;
.super Lc/a/a/a/d0/l;
.source "PasswordToggleEndIconDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/p0/h;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/h;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/h$a;->h:Lc/a/a/a/p0/h;

    invoke-direct {p0}, Lc/a/a/a/d0/l;-><init>()V

    return-void
.end method


# virtual methods
.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/h$a;->h:Lc/a/a/a/p0/h;

    iget-object p2, p1, Lc/a/a/a/p0/e;->c:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {p1}, Lc/a/a/a/p0/h;->a(Lc/a/a/a/p0/h;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p2, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setChecked(Z)V

    return-void
.end method
