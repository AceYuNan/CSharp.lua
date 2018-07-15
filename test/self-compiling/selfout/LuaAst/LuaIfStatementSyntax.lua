-- Generated by CSharp.lua Compiler
--[[
Copyright 2017 YANG Huan (sy.yanghuan@gmail.com).

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]
local System = System
local CSharpLua
local CSharpLuaLuaAst
System.usingDeclare(function (global)
  CSharpLua = global.CSharpLua
  CSharpLuaLuaAst = CSharpLua.LuaAst
end)
System.namespace("CSharpLua.LuaAst", function (namespace)
  namespace.class("LuaIfStatementSyntax", function (namespace)
    local getIfKeyword, getOpenParenToken, getCloseParenToken, Render, __init__, __ctor__
    __init__ = function (this)
      this.Body = CSharpLuaLuaAst.LuaBlockSyntax()
      this.ElseIfStatements = CSharpLuaLuaAst.LuaSyntaxList_1(CSharpLuaLuaAst.LuaElseIfStatementSyntax)()
    end
    __ctor__ = function (this, condition)
      __init__(this)
      this.__base__.__ctor__(this)
      this.Condition = condition or System.throw(CSharpLua.ArgumentNullException("condition" --[[nameof(condition)]]))
    end
    getIfKeyword = function (this)
      return "if" --[[Keyword.If]]
    end
    getOpenParenToken = function (this)
      return "then" --[[Keyword.Then]]
    end
    getCloseParenToken = function (this)
      return "end" --[[Keyword.End]]
    end
    Render = function (this, renderer)
      renderer:Render41(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end,
      getIfKeyword = getIfKeyword,
      getOpenParenToken = getOpenParenToken,
      getCloseParenToken = getCloseParenToken,
      Render = Render,
      __ctor__ = __ctor__
    }
  end)

  namespace.class("LuaElseIfStatementSyntax", function (namespace)
    local getElseIfKeyword, getOpenParenToken, Render, __init__, __ctor__
    __init__ = function (this)
      this.Body = CSharpLuaLuaAst.LuaBlockSyntax()
    end
    __ctor__ = function (this, condition)
      __init__(this)
      this.__base__.__ctor__(this)
      this.Condition = condition or System.throw(CSharpLua.ArgumentNullException("condition" --[[nameof(condition)]]))
    end
    getElseIfKeyword = function (this)
      return "elseif" --[[Keyword.ElseIf]]
    end
    getOpenParenToken = function (this)
      return "then" --[[Keyword.Then]]
    end
    Render = function (this, renderer)
      renderer:Render42(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end,
      getElseIfKeyword = getElseIfKeyword,
      getOpenParenToken = getOpenParenToken,
      Render = Render,
      __ctor__ = __ctor__
    }
  end)

  namespace.class("LuaElseClauseSyntax", function (namespace)
    local getElseKeyword, Render, __init__, __ctor__
    __init__ = function (this)
      this.Body = CSharpLuaLuaAst.LuaBlockSyntax()
    end
    __ctor__ = function (this)
      __init__(this)
      this.__base__.__ctor__(this)
    end
    getElseKeyword = function (this)
      return "else" --[[Keyword.Else]]
    end
    Render = function (this, renderer)
      renderer:Render43(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaSyntaxNode
        }
      end,
      getElseKeyword = getElseKeyword,
      Render = Render,
      __ctor__ = __ctor__
    }
  end)

  namespace.class("LuaSwitchAdapterStatementSyntax", function (namespace)
    local Fill, CheckHasDefaultLabel, FindMatchIfStatement, CheckHasCaseLabel, Render, __init__, __ctor__
    __init__ = function (this)
      this.RepeatStatement = CSharpLuaLuaAst.LuaRepeatStatementSyntax(CSharpLuaLuaAst.LuaIdentifierNameSyntax.One)
      this.caseLabelVariables_ = CSharpLuaLuaAst.LuaLocalVariablesStatementSyntax()
      this.CaseLabels = System.Dictionary(System.Int, CSharpLuaLuaAst.LuaIdentifierNameSyntax)()
    end
    __ctor__ = function (this, temp)
      __init__(this)
      this.__base__.__ctor__(this)
      this.Temp = temp
    end
    Fill = function (this, expression, sections)
      if expression == nil then
        System.throw(CSharpLua.ArgumentNullException("expression" --[[nameof(expression)]]))
      end
      if sections == nil then
        System.throw(CSharpLua.ArgumentNullException("sections" --[[nameof(sections)]]))
      end

      local body = this.RepeatStatement.Body
      body.Statements:Add(this.caseLabelVariables_)
      body.Statements:Add(CSharpLuaLuaAst.LuaLocalVariableDeclaratorSyntax:new(2, this.Temp, expression))

      local ifStatement = nil
      for _, section in System.each(sections) do
        local statement = System.as(section, CSharpLuaLuaAst.LuaIfStatementSyntax)
        if statement ~= nil then
          if ifStatement == nil then
            ifStatement = statement
          else
            local elseIfStatement = CSharpLuaLuaAst.LuaElseIfStatementSyntax(statement.Condition)
            elseIfStatement.Body.Statements:AddRange(statement.Body.Statements)
            ifStatement.ElseIfStatements:Add(elseIfStatement)
          end
        else
          assert(this.defaultBock_ == nil)
          this.defaultBock_ = System.cast(CSharpLuaLuaAst.LuaBlockSyntax, section)
        end
      end

      if ifStatement ~= nil then
        body.Statements:Add(ifStatement)
        if this.defaultBock_ ~= nil then
          local elseClause = CSharpLuaLuaAst.LuaElseClauseSyntax()
          elseClause.Body.Statements:AddRange(this.defaultBock_.Statements)
          ifStatement.Else = elseClause
        end
        this.headIfStatement_ = ifStatement
      else
        if this.defaultBock_ ~= nil then
          body.Statements:AddRange(this.defaultBock_.Statements)
        end
      end
    end
    CheckHasDefaultLabel = function (this)
      if this.DefaultLabel ~= nil then
        assert(this.defaultBock_ ~= nil)
        this.caseLabelVariables_.Variables:Add(this.DefaultLabel)
        local labeledStatement = CSharpLuaLuaAst.LuaLabeledStatement(this.DefaultLabel)
        this.RepeatStatement.Body.Statements:Add(labeledStatement)
        local IfStatement = CSharpLuaLuaAst.LuaIfStatementSyntax(this.DefaultLabel)
        IfStatement.Body.Statements:AddRange(this.defaultBock_.Statements)
        this.RepeatStatement.Body.Statements:Add(IfStatement)
      end
    end
    FindMatchIfStatement = function (this, index)
      if index == 0 then
        return this.headIfStatement_.Body
      else
        return this.headIfStatement_.ElseIfStatements:get(index - 1).Body
      end
    end
    CheckHasCaseLabel = function (this)
      if this.CaseLabels:getCount() > 0 then
        assert(this.headIfStatement_ ~= nil)
        this.caseLabelVariables_.Variables:AddRange(this.CaseLabels:getValues())
        for _, pair in System.each(this.CaseLabels) do
          local caseLabelStatement = FindMatchIfStatement(this, pair.Key)
          local labelIdentifier = pair.Value
          this.RepeatStatement.Body.Statements:Add(CSharpLuaLuaAst.LuaLabeledStatement(labelIdentifier))
          local ifStatement = CSharpLuaLuaAst.LuaIfStatementSyntax(labelIdentifier)
          ifStatement.Body.Statements:AddRange(caseLabelStatement.Statements)
          this.RepeatStatement.Body.Statements:Add(ifStatement)
        end
      end
    end
    Render = function (this, renderer)
      CheckHasCaseLabel(this)
      CheckHasDefaultLabel(this)
      renderer:Render49(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaStatementSyntax
        }
      end,
      Fill = Fill,
      Render = Render,
      __ctor__ = __ctor__
    }
  end)
end)
