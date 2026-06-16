.class public abstract Lb/l/d/q;
.super Ljava/lang/Object;
.source "FragmentTransaction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/l/d/q$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/l/d/q$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ljava/lang/CharSequence;

.field public k:I

.field public l:Ljava/lang/CharSequence;

.field public m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z

.field public p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/l/d/g;Ljava/lang/ClassLoader;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lb/l/d/q;->o:Z

    return-void
.end method


# virtual methods
.method public abstract a()I
.end method

.method public a(ILandroidx/fragment/app/Fragment;)Lb/l/d/q;
    .registers 4

    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, p2, v0}, Lb/l/d/q;->b(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;

    return-object p0
.end method

.method public a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;
    .registers 5

    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/l/d/q;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    return-object p0
.end method

.method public a(Landroid/view/ViewGroup;Landroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;
    .registers 4

    .line 8
    iput-object p1, p2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    move-result p1

    invoke-virtual {p0, p1, p2, p3}, Lb/l/d/q;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;

    return-object p0
.end method

.method public a(Landroidx/fragment/app/Fragment;)Lb/l/d/q;
    .registers 4

    .line 24
    new-instance v0, Lb/l/d/q$a;

    const/4 v1, 0x7

    invoke-direct {v0, v1, p1}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {p0, v0}, Lb/l/d/q;->a(Lb/l/d/q$a;)V

    return-object p0
.end method

.method public a(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, p1, p2, v1}, Lb/l/d/q;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    return-object p0
.end method

.method public a(Z)Lb/l/d/q;
    .registers 2

    .line 25
    iput-boolean p1, p0, Lb/l/d/q;->o:Z

    return-object p0
.end method

.method public a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V
    .registers 8

    .line 10
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v1

    .line 12
    invoke-virtual {v0}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result v2

    if-nez v2, :cond_bb

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-eqz v2, :cond_bb

    .line 13
    invoke-virtual {v0}, Ljava/lang/Class;->isMemberClass()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_bb

    :cond_20
    const-string v0, " now "

    const-string v1, ": was "

    if-eqz p3, :cond_58

    .line 14
    iget-object v2, p2, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    if-eqz v2, :cond_56

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    goto :goto_56

    .line 15
    :cond_31
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t change tag of fragment "

    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p2, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 16
    :cond_56
    :goto_56
    iput-object p3, p2, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    :cond_58
    if-eqz p1, :cond_b2

    const/4 v2, -0x1

    if-eq p1, v2, :cond_8e

    .line 17
    iget p3, p2, Landroidx/fragment/app/Fragment;->D:I

    if-eqz p3, :cond_89

    if-ne p3, p1, :cond_64

    goto :goto_89

    .line 18
    :cond_64
    new-instance p3, Ljava/lang/IllegalStateException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t change container ID of fragment "

    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p2, Landroidx/fragment/app/Fragment;->D:I

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p3

    .line 19
    :cond_89
    :goto_89
    iput p1, p2, Landroidx/fragment/app/Fragment;->D:I

    iput p1, p2, Landroidx/fragment/app/Fragment;->E:I

    goto :goto_b2

    .line 20
    :cond_8e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Can\'t add fragment "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " with tag "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " to container view with no id"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 21
    :cond_b2
    :goto_b2
    new-instance p1, Lb/l/d/q$a;

    invoke-direct {p1, p4, p2}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {p0, p1}, Lb/l/d/q;->a(Lb/l/d/q$a;)V

    return-void

    .line 22
    :cond_bb
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Fragment "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " must be a public static class to be  properly recreated from instance state."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Lb/l/d/q$a;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2
    iget v0, p0, Lb/l/d/q;->b:I

    iput v0, p1, Lb/l/d/q$a;->c:I

    .line 3
    iget v0, p0, Lb/l/d/q;->c:I

    iput v0, p1, Lb/l/d/q$a;->d:I

    .line 4
    iget v0, p0, Lb/l/d/q;->d:I

    iput v0, p1, Lb/l/d/q$a;->e:I

    .line 5
    iget v0, p0, Lb/l/d/q;->e:I

    iput v0, p1, Lb/l/d/q$a;->f:I

    return-void
.end method

.method public abstract b()I
.end method

.method public b(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Lb/l/d/q;
    .registers 5

    if-eqz p1, :cond_7

    const/4 v0, 0x2

    .line 1
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/l/d/q;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    return-object p0

    .line 2
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Must use non-zero containerViewId"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Landroidx/fragment/app/Fragment;)Lb/l/d/q;
    .registers 4

    .line 3
    new-instance v0, Lb/l/d/q$a;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p1}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {p0, v0}, Lb/l/d/q;->a(Lb/l/d/q$a;)V

    return-object p0
.end method

.method public c(Landroidx/fragment/app/Fragment;)Lb/l/d/q;
    .registers 4

    .line 1
    new-instance v0, Lb/l/d/q$a;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p1}, Lb/l/d/q$a;-><init>(ILandroidx/fragment/app/Fragment;)V

    invoke-virtual {p0, v0}, Lb/l/d/q;->a(Lb/l/d/q$a;)V

    return-object p0
.end method

.method public abstract c()V
.end method

.method public abstract d()V
.end method

.method public e()Lb/l/d/q;
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/l/d/q;->g:Z

    if-nez v0, :cond_5

    return-object p0

    .line 2
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This transaction is already being added to the back stack"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
