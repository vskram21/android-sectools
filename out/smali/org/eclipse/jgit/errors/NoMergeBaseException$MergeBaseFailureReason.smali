.class public final enum Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;
.super Ljava/lang/Enum;
.source "NoMergeBaseException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/errors/NoMergeBaseException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MergeBaseFailureReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

.field public static final enum CONFLICTS_DURING_MERGE_BASE_CALCULATION:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

.field public static final enum MULTIPLE_MERGE_BASES_NOT_SUPPORTED:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

.field public static final enum TOO_MANY_MERGE_BASES:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 72
    new-instance v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    const-string v1, "MULTIPLE_MERGE_BASES_NOT_SUPPORTED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->MULTIPLE_MERGE_BASES_NOT_SUPPORTED:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    .line 77
    new-instance v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    const-string v1, "TOO_MANY_MERGE_BASES"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->TOO_MANY_MERGE_BASES:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    .line 84
    new-instance v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    const-string v1, "CONFLICTS_DURING_MERGE_BASE_CALCULATION"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->CONFLICTS_DURING_MERGE_BASE_CALCULATION:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    .line 66
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    sget-object v1, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->MULTIPLE_MERGE_BASES_NOT_SUPPORTED:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->TOO_MANY_MERGE_BASES:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->CONFLICTS_DURING_MERGE_BASE_CALCULATION:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->$VALUES:[Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

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
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;
    .locals 1
    .parameter "name"

    .prologue
    .line 66
    const-class v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->$VALUES:[Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    return-object v0
.end method
