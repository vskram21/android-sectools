.class public final enum Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;
.super Ljava/lang/Enum;
.source "ListBranchCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/ListBranchCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ListMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

.field public static final enum ALL:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

.field public static final enum REMOTE:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 90
    new-instance v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    const-string v1, "ALL"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->ALL:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    .line 94
    new-instance v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    const-string v1, "REMOTE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->REMOTE:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    .line 86
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    sget-object v1, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->ALL:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->REMOTE:Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->$VALUES:[Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 86
    const-class v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->$VALUES:[Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/ListBranchCommand$ListMode;

    return-object v0
.end method
