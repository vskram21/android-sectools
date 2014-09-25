.class Lorg/eclipse/jgit/lib/ConfigLine;
.super Ljava/lang/Object;
.source "ConfigLine.java"


# instance fields
.field name:Ljava/lang/String;

.field prefix:Ljava/lang/String;

.field section:Ljava/lang/String;

.field subsection:Ljava/lang/String;

.field suffix:Ljava/lang/String;

.field value:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static eqIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 100
    if-nez p0, :cond_0

    if-nez p1, :cond_0

    .line 101
    const/4 v0, 0x1

    .line 104
    :goto_0
    return v0

    .line 102
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 103
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 104
    :cond_2
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method private static eqSameCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 108
    if-nez p0, :cond_0

    if-nez p1, :cond_0

    .line 109
    const/4 v0, 0x1

    .line 112
    :goto_0
    return v0

    .line 110
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 111
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 112
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method forValue(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ConfigLine;
    .locals 2
    .parameter "newValue"

    .prologue
    .line 77
    new-instance v0, Lorg/eclipse/jgit/lib/ConfigLine;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ConfigLine;-><init>()V

    .line 78
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/lib/ConfigLine;->prefix:Ljava/lang/String;

    .line 79
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    .line 80
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    .line 81
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    .line 82
    iput-object p1, v0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    .line 83
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/lib/ConfigLine;->suffix:Ljava/lang/String;

    .line 84
    return-object v0
.end method

.method match(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "aSection"
    .parameter "aSubsection"

    .prologue
    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/eclipse/jgit/lib/ConfigLine;->eqIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    invoke-static {v0, p2}, Lorg/eclipse/jgit/lib/ConfigLine;->eqSameCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "aSection"
    .parameter "aSubsection"
    .parameter "aKey"

    .prologue
    .line 89
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/eclipse/jgit/lib/ConfigLine;->eqIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    invoke-static {v0, p2}, Lorg/eclipse/jgit/lib/ConfigLine;->eqSameCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-static {v0, p3}, Lorg/eclipse/jgit/lib/ConfigLine;->eqIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 118
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 119
    const-string v1, "<empty>"

    .line 127
    :goto_0
    return-object v1

    .line 120
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, b:Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 122
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 124
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 126
    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
