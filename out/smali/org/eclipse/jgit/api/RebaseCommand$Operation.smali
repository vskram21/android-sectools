.class public final enum Lorg/eclipse/jgit/api/RebaseCommand$Operation;
.super Ljava/lang/Enum;
.source "RebaseCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/RebaseCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Operation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/RebaseCommand$Operation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/RebaseCommand$Operation;

.field public static final enum ABORT:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

.field public static final enum BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

.field public static final enum CONTINUE:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

.field public static final enum PROCESS_STEPS:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

.field public static final enum SKIP:Lorg/eclipse/jgit/api/RebaseCommand$Operation;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 177
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    const-string v1, "BEGIN"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/RebaseCommand$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 181
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    const-string v1, "CONTINUE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/RebaseCommand$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->CONTINUE:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 185
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    const-string v1, "SKIP"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/RebaseCommand$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->SKIP:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 189
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    const-string v1, "ABORT"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/api/RebaseCommand$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->ABORT:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 194
    new-instance v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    const-string v1, "PROCESS_STEPS"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/RebaseCommand$Operation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->PROCESS_STEPS:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    .line 173
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->BEGIN:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->CONTINUE:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->SKIP:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->ABORT:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->PROCESS_STEPS:Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->$VALUES:[Lorg/eclipse/jgit/api/RebaseCommand$Operation;

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
    .line 173
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/RebaseCommand$Operation;
    .locals 1
    .parameter "name"

    .prologue
    .line 173
    const-class v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/RebaseCommand$Operation;
    .locals 1

    .prologue
    .line 173
    sget-object v0, Lorg/eclipse/jgit/api/RebaseCommand$Operation;->$VALUES:[Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/RebaseCommand$Operation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/RebaseCommand$Operation;

    return-object v0
.end method
